import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restlogin/models/user.dart';
import 'package:restlogin/models/userresponse.dart';
import 'package:restlogin/repos/loginrepo_impl.dart';


part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final LoginRepoImpl _loginRepo = LoginRepoImpl();

  LoginCubitCubit() : super(LoginCubitInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading()); // Emit loading state

    // Create a User object
    User user = User(username: username, password: password);

    // Validate user input
    bool isValid = _loginRepo.validateUser(user);
    if (!isValid) {
      emit(LoginFailure(_loginRepo.message)); // Emit failure state with validation error
      return;
    }

    // Authenticate user
    try {
      List<UserResponse>? authResult = await _loginRepo.authenticateUser(user);
      if (authResult != null && authResult.isNotEmpty) {
        emit(LoginSuccess(authResult)); // Emit success state with user details
      } else {
        emit(LoginFailure("Failed to authenticate user.")); // Emit failure state
      }
    } catch (e) {
      emit(LoginFailure("An error occurred: $e")); // Emit failure state with error
    }
  }
}