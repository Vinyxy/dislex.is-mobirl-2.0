import 'package:dislexiamobile/model/sqlite/db.dart';

class UserModel {
  int? ID = 0;
  String? email = '';
  String? senha = '';
  String? nome = '';
  String? telefone = '';

  Future<bool> doLogin(UserModel userModel) async {
    try {
      UserModel? user = await DatabaseHelper().getUser(userModel);
      print(user);
      if (user == null) {
        return false;
      }
      return true;
    } catch (e, s) {
      print(e);
      print(s);
      return false;
    }
  }

  Future<bool> doRegister(UserModel userModel) async {
    try {
      await DatabaseHelper().saveUser(userModel);
      return true;
    } catch (u, x) {
      print(u);
      print(x);
      return false;
    }
  }

  UserModel({
    this.email,
    this.senha,
  });

  UserModel.fromJson(dynamic obj)
      : this.email = obj['email'].toString(),
        this.senha = obj['password'];

  Map<String, dynamic> toMap() => {'email': email, 'password': senha};
}
