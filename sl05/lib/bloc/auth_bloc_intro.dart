import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocIntro extends Bloc<AuthEvent, AuthState> {
  //COMO CONFIGURAR O STATE INICIAL
  AuthBlocIntro(super.initialState) {
    on<RegisterUser>((event, emit) => emit(Unauthenticated()));
    on<LoginUser>((event, emit) {
      if (event.password == "senha") {
        emit(Authenticated(username: event.username));
      } else {
        emit(AuthError(message: "Impossível Logar com $event.username"));
      }
    });
    on<Logout>((event, emit) => emit(Unauthenticated()));
  }
}

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;

  RegisterUser({required this.username, required this.password});
}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class Logout extends AuthEvent {}

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String username;

  Authenticated({required this.username});
}

class AuthError extends AuthState {
  String message;

  AuthError({required this.message});
}
