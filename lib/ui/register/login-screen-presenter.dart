import 'package:awoof_app/model/user.dart';
import 'package:awoof_app/networking/rest-data.dart';

/// An abstract class to handle the success response and error response
/// from my [LoginScreen]
abstract class LoginScreenContract {

  /// Method to handle the success response from logging in
  void onLoginSuccess(User user);

  /// Method to handle the error response from logging in
  void onLoginError(String errorTxt);

}

/// A class to send the login details to the login endpoint
/// It sends back [onLoginSuccess] in my [LoginScreenContract] class
/// if it is successful or [onLoginError] if it catches error
class LoginScreenPresenter {

  /// An instance of my abstract class [LoginScreenContract]
  LoginScreenContract _view;

  /// An instance [RestDataSource] class to do the API requests
  RestDataSource api = new RestDataSource();

  /// A constructor of [LoginScreenPresenter] class to hold [_view]
  LoginScreenPresenter(this._view);

  /// Function to send the login details to the login endpoint
  /// /// It sends back [onLoginSuccess] in my [LoginScreenContract] class
  /// if it is successful or [onLoginError] if it catches error
  doLogin(String email, String password) {
    api.login(email, password).then((User user) {
      _view.onLoginSuccess(user);
    }).catchError((error) {
      _view.onLoginError(error);
    });
  }
}