import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:ocr_app/repository/users.repository.dart';

abstract class RepositoriesEvent{}
abstract class RepositoriesState{}
class GetUserRepositoriesEvent extends RepositoriesEvent{
  String user;
  GetUserRepositoriesEvent({required this.user});
}
class RepositoriesSuccessState extends RepositoriesState {
  List<dynamic> repositories=[];
  RepositoriesSuccessState({required this.repositories});
}
class RepositoriesLoadingState extends RepositoriesState {
}
class RepositoriesErrorState extends RepositoriesState {
  String errorMessage;
  RepositoriesErrorState(this.errorMessage);
}
class RepositoriesBloc extends Bloc<RepositoriesEvent,RepositoriesState>{
  UsersRepository usersRepository=UsersRepository();
  late RepositoriesEvent lastEvent;
  RepositoriesBloc() : super(RepositoriesSuccessState(repositories: [])){
   on((GetUserRepositoriesEvent event, emit)async {
     emit(RepositoriesLoadingState());
     lastEvent=event;
     try{
       List<dynamic> data=await usersRepository.repositories(event.user);
       emit(RepositoriesSuccessState(repositories: data));
     }
     catch(ex){
       emit(RepositoriesErrorState(ex.toString()));
     }
   });
  }
}