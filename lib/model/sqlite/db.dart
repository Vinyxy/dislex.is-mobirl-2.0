import 'dart:io';
import 'package:dislexiamobile/model/userModel.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  // create database
  initDb() async {
    // Directory documentDirectory = await getApplicationDocumentsDirectory();
    // print(documentDirectory);
    //String path = join(documentDirectory.path,"main.db");
    String path = join('assets/', "main.db");
    //await deleteDatabase('main.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // create tables
  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE User(id INTEGER AUTO INCREMENT PRIMARY KEY,email TEXT, password TEXT, nome TEXT, telefone TEXT)",
    );
    await db.execute(
      "CREATE TABLE Leitura(id INTEGER AUTO INCREMENT PRIMARY KEY, imagem TEXT, autor TEXT, nome TEXT, dataFinal  TEXT, link TEXT)",
    );
    // note that Im inserting password as plain text. When you implement please store it as a hash for security purposes.
  }

//https://static.wikia.nocookie.net/fronteirasdouniverso/images/1/1d/A_b%C3%BAssola_de_ouro_livro_capa.jpg/revision/latest?cb=20160121014006&path-prefix=pt-br
  // insert user to db when login
  Future<int> saveUser(UserModel user) async {
    Database? dbUser = await db;
    int res = await dbUser!.insert(
      'User',
      {
        "Nome": user.nome,
        "email": user.email,
        "Telefone": user.telefone,
        "password": user.senha,
      },
    );
    return res;
  }

  // retrieve user from db
  Future<UserModel?> getUser(UserModel userModel) async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery(
        "SELECT * FROM User WHERE email = '${userModel.email}' and password = '${userModel.senha}'");

    if (list.length > 0) {
      return new UserModel.fromJson(list.first);
    }
    return null;
  }

  //delete use when logout
  Future<int> deleteUser() async {
    var dbClient = await db;
    int res = await dbClient!.delete("User");
    return res;
  }

  // check if the user logged in when app launch or any other place
  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient!.query("User");
    return res.length > 0 ? true : false;
  }
}
