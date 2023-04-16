import 'package:get/state_manager.dart';
import 'package:state_management/domain/core/user/user_data.dart';

class UserController extends GetxController {
  final _listUserData = <UserData>[];

  addDataToList(UserData data) {
    _listUserData.add(data);
    update();
  }

  List<UserData> get getListUserData => _listUserData;

  deleteDataToList(UserData data) {
    _listUserData.remove(data);
    update();
  }
}
