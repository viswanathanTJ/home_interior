import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class UserDB{
  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String _mailid;

  String get mailid => _mailid;

  set mailid(String mailid) {
    _mailid = mailid;
  }

  String _pass;

  String get pass => _pass;

  set pass(String pass) {
    _pass = pass;
  }

  UserDB(this._name, this._mailid, this._pass);


  // UserDB();

  factory UserDB.fromJson(Map<String, dynamic> json){
    return UserDB(json['name'], json['mailid'], json['password']);
  }
  Map<String, dynamic> toJson(UserDB json){
    return {
      'name':json.name,
      'mailid':json.mailid,
      'password':json.pass
    };
  }
  static var database;
  static init() async{
    database = await openDatabase('users',
      version: 1,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE users(name TEXT, mailid TEXT, pass TEXT)');
    });
    print('created');
    // print(database.rawQuery('SELECT *FROM users'));
  }
  void insertDB(){
    database.insert('users', toJson(this));
  }
  static Future<bool> check(String mail, String pass) async{
    List<Map<String, dynamic>> checkMap = await database.query('users', where:"mailid=?", whereArgs:[mail], limit:1);
    if(checkMap[0]!=null&&checkMap[0]['pass']==pass) return true;
    else return false;
  }
}