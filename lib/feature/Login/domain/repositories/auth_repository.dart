abstract class AuthRepository{
  Future<bool> hasToken({bool authentication = false});
}