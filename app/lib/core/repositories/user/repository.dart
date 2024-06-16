import '../../api/user/service.dart';
import 'interface.dart';
import 'models/user.dart';

class UserRepositoryImpl extends UserRepository {
  final UserService _userService;

  UserRepositoryImpl(this._userService);

  @override
  Future<UserDataModel> getSelfData() async {
    try {
      final response = await _userService.view();

      return UserDataModel.fromRespons(response);
    } catch (ex) {
      final error = ex.toString().substring(11);

      return UserDataModel.error(message: error);
    }
  }
}
