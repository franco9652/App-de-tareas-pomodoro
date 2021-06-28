part of 'pomodoro_bloc.dart';

abstract class PomodoroEvent extends Equatable {
  const PomodoroEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends PomodoroEvent {
  final int duration;
  const TimerStarted({@required this.duration});
}

class TimerPaused extends PomodoroEvent {
  const TimerPaused();
}

class TimerResumed extends PomodoroEvent {
  const TimerResumed();
}

class TimerReset extends PomodoroEvent {
  const TimerReset();
}

class TimerTicked extends PomodoroEvent {
  final int duration;
  const TimerTicked({@required this.duration});

  @override
  List<Object> get props => [duration];
}
