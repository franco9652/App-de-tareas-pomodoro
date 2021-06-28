part of 'pomodoro_bloc.dart';

abstract class PomodoroState extends Equatable {
  final int duration;
  const PomodoroState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends PomodoroState {
  TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInit {duration: $duration}';
}

class TimerRunPause extends PomodoroState {
  TimerRunPause(int duration) : super(duration);

  @override
  String toString() => 'TimerRunPause {duration: $duration}';
}

class TimerRunInProgress extends PomodoroState {
  TimerRunInProgress(int duration) : super(duration);
  @override
  String toString() => 'TimerRunInProgres {duration $duration}';
}

class TimerComplete extends PomodoroState {
  TimerComplete() : super(0);
}
