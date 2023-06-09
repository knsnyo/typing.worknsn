import 'package:app/src/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserModel> {
  UserBloc() : super(UserModel(user: false)) {
    on<UserSigninEvent>((UserSigninEvent event, Emitter<UserModel> emit) =>
        emit(UserModel(user: true)));
    on<UserSignoutEvent>((UserSignoutEvent event, Emitter<UserModel> emit) =>
        emit(UserModel(user: false)));
  }
}
