import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required GetCurrentPositionUsecase getCurrentPositionUsecase,
    required GetWeatherUsecase getWeatherUsecase,
  })  : _getCurrentPositionUsecase = getCurrentPositionUsecase,
        _getWeatherUsecase = getWeatherUsecase,
        super(WeatherInitialState());

  final GetCurrentPositionUsecase _getCurrentPositionUsecase;
  final GetWeatherUsecase _getWeatherUsecase;

  void getCurrentPosition() async {
    emit(WeatherLoadingState());
    final currentPositionEither = await _getCurrentPositionUsecase();
    currentPositionEither.fold((failure) {
      emit(CurrentPositionErrorState(message: failure.message));
    }, (currentPositionEntity) {
      emit(
        CurrentPositionLoadedState(
          currentPositionEntity: currentPositionEntity,
        ),
      );
    });
  }

  void getWeather() async {
    final currentState = state as CurrentPositionLoadedState;
    emit(WeatherLoadingState());
    final weatherEither = await _getWeatherUsecase(
        currentPositionEntity: currentState.currentPositionEntity);
    weatherEither.fold((failure) {
      emit(
        WeatherErrorState(
          message: failure.message,
          currentPositionEntity: currentState.currentPositionEntity,
        ),
      );
    }, (weatherEntity) {
      emit(
        WeatherLoadedState(
          currentPositionEntity: currentState.currentPositionEntity,
          weatherEntity: weatherEntity,
        ),
      );
    });
  }
}
