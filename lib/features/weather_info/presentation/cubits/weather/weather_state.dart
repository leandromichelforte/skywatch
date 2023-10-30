part of 'weather_cubit.dart';

@immutable
sealed class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WeatherErrorState extends CurrentPositionLoadedState {
  WeatherErrorState({
    required this.message,
    required super.currentPositionEntity,
  });
  final String message;

  @override
  List<Object> get props => [
        message,
        currentPositionEntity,
      ];
}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends CurrentPositionLoadedState {
  WeatherLoadedState({
    required super.currentPositionEntity,
    required this.weatherEntity,
  });

  final WeatherEntity weatherEntity;

  @override
  List<Object> get props => [currentPositionEntity, weatherEntity];
}

final class CurrentPositionErrorState extends WeatherState {
  CurrentPositionErrorState({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [message];
}

final class CurrentPositionLoadedState extends WeatherState {
  CurrentPositionLoadedState({
    required this.currentPositionEntity,
  });
  final CurrentPositionEntity currentPositionEntity;
}
