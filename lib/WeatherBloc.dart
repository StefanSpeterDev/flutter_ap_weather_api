import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_api/WeatherRepo.dart';
import 'package:weather_api/WeatherModel.dart';

class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
// Quand l'user fait
class FetchWeatherEvent extends WeatherEvent{

  final _city;

  FetchWeatherEvent(this._city);

  List<Object> get props => [_city];

}

// Quand l'user fait une nouvelle recherche
class ResetWeather extends WeatherEvent{

}

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WeatherIsNotSearched extends WeatherState{

}

// Quand on fait la recherche
class WeatherIsLoading extends WeatherState{

}

class WeatherIsLoaded extends WeatherState{
  final _weather;

  WeatherIsLoaded(this._weather);

  List<Object> get props => [_weather];

  WeatherModel get getWeather => _weather;

}
// Si il y a une erreur
class WeatherIsNotLoaded extends WeatherState{

}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{

  WeatherRepo weatherRepo;
  WeatherBloc(this.weatherRepo);

  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherIsNotSearched();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event)  async*{
    // TODO: implement mapEventToState
    if(event is FetchWeatherEvent){
      yield WeatherIsLoading();

      try{
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(weather);
      }catch(_){
        yield WeatherIsNotLoaded();
      }
    }else if(event is ResetWeather){
      yield WeatherIsNotSearched();
    }
  }

}
