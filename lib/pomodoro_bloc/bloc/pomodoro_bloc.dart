import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tareas_facu_app/models/ticker.dart';

part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  final Ticker ticker;
  static const int duration = 60;
  StreamSubscription<int> tickerSubscription;
  PomodoroBloc({@required Ticker ticker})
      : ticker = ticker,
        super(TimerInitial(duration));

  @override
  Stream<PomodoroState> mapEventToState(
    PomodoroEvent event,
  ) async* {
    if (event is TimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is TimerPaused) {
      yield* _mapTimerPusedToState(event);
    } else if (event is TimerResumed) {
      yield* _mapTimerResumedToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    } else if (event is TimerTicked) {
      yield* _mapTimerTickedToState(event);
    }
  }

  Stream<PomodoroState> _mapTimerStartedToState(TimerStarted start) async* {
    yield TimerRunInProgress(start.duration);
    tickerSubscription?.cancel();
    tickerSubscription = ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  Stream<PomodoroState> _mapTimerPusedToState(TimerPaused pause) async* {
    if (state is TimerRunInProgress) {
      tickerSubscription?.pause();
      yield TimerRunPause(state.duration);
    }
  }

  Stream<PomodoroState> _mapTimerResumedToState(TimerResumed resume) async* {
    if (state is TimerRunPause) {
      tickerSubscription?.resume();
      yield TimerRunInProgress(state.duration);
    }
  }

  Stream<PomodoroState> _mapTimerResetToState(TimerReset reset) async* {
    tickerSubscription?.cancel();
    yield TimerInitial(duration);
  }

  Stream<PomodoroState> _mapTimerTickedToState(TimerTicked tick) async* {
    yield tick.duration > 0
        ? TimerRunInProgress(tick.duration)
        : TimerComplete();
  }
}
