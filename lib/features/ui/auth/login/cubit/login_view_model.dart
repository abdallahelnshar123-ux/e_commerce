import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/use_cases/login_use_cases.dart';
import 'package:e_commerce/features/ui/auth/auth_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  final LoginUseCases _loginUseCases;

  LoginViewModel(this._loginUseCases) : super(AuthInitState());
}


// todo: view => view model
// todo: view model => use case
// todo: use case => repository
// todo: repository => remote ds
// todo: remote ds => api services