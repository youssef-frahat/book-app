abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class Loginstate extends AuthStates {}

class LoginLoadingstate extends AuthStates {}

class LoginErrorstate extends AuthStates {}

class Registerstate extends AuthStates {}

class RegisterLoadingstate extends AuthStates {}

class RegisterErrorstate extends AuthStates {}
