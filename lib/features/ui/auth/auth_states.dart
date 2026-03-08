sealed class AuthStates {}

class AuthInitState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthSuccessState extends AuthStates{}
class AuthErrorState extends AuthStates{}