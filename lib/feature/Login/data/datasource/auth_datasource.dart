abstract class AuthDataSource{
  /// Checks whether or not the authentication/authorization token exists.
  /// Set [authentication] to true to check the authentication token.
  /// Default checks the authorization token.
  Future<bool> hasToken({bool authentication = false});
}