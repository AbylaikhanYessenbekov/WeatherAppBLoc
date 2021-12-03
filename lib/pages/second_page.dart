import 'package:bloc_app/bloc/weather_bloc.dart';
import 'package:bloc_app/bloc/weather_event.dart';
import 'package:bloc_app/bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondPage extends StatelessWidget {
  String city;
  WeatherBloc _bloc = WeatherBloc();
  SecondPage({required this.city}) {
    _bloc.add(WeatherGetEvent(city: city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
      ),
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.indigoAccent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Currently in $city',
                            style: TextStyle(fontSize: 20.0, color: Colors.white,),
                          ),
                          SizedBox(height: 15.0,),
                          Text(
                              '${(state.weatherJson.main!.temp! - 273).round().toString()} C',
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                          // Text('${state.weatherJson.weather.} ')
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.temperatureHigh),
                            title: Text('Temperature'),
                            trailing: Text(
                                '${(state.weatherJson.main!.temp! - 273).round().toString()} C'),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.cloud),
                            title: Text('Wind Speed'),
                            trailing: Text(
                                '${(state.weatherJson.weather![0].description).toString()}'),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.cloudRain),
                            title: Text('Humidity'),
                            trailing: Text(
                                '${(state.weatherJson.main!.humidity).toString()}'),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.wind),
                            title: Text('Wind Speed'),
                            trailing: Text(
                                '${(state.weatherJson.wind!.speed).toString()}'),
                          ),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                  Text('${state.weatherJson.main!.pressure.toString()} Pa'),
                ],
              );
            }
            return Container();
          }),
    );
  }
}
