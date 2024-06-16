import 'models/user.dart';

abstract class UserRepository {
  Future<UserDataModel> getSelfData();
}
