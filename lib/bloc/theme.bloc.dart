import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent {}
class SwitchThemeEvent extends ThemeEvent{}
class ThemeState {
  final ThemeData theme;
  ThemeState(this.theme);
}
class InitialTheme extends ThemeState{
  InitialTheme() : super(ThemeData(primarySwatch: Colors.teal));
}

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  int index=0;
  List<ThemeData> themes=[
    ThemeData(primarySwatch:Colors.teal ),
    ThemeData(primarySwatch:Colors.deepOrange),
    ThemeData(primarySwatch:Colors.blue ),
  ];
  ThemeBloc() : super(InitialTheme()){
    on((SwitchThemeEvent event, emit) {
      ++index; if(index>=themes.length) index=0;
      emit(ThemeState(themes[index]));
    });
  }
}