import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AdminDB {
  static var database;
  static init() async{
    var path = await getDatabasesPath();
    // WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(
        join(path, 'my_db.db'),
        onCreate: (Database db, int version) async{
          return db.execute('CREATE TABLE admin(mail TEXT, password TEXT)');
        },
      version: 1
    );
    print(database.isOpen);
    // insert();
    // database.rawQuery('DELETE FROM admin WHERE mail="admin@gmail.com"');

    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'demo.db');
  }
  insert() async{
    await database.transaction((txn)async{
      int id = await txn.rawInsert('insert into admin values("admin@gmail.com", "12345678")');
      print(id);
    });
    List<Map<String, dynamic>> map = await database.rawQuery('SELECT *FROM admin');
    print(map);
  }
  static bool Check(String mail, String pass, int i){
    return mail=='admin@gmail.com' && pass=='12345678';
  }
  static Future<bool> check(String mail, String pass) async{
    List<Map<String, dynamic>> checkMap = await database.query('admin', where:"mail=?", whereArgs:[mail], limit:1);
    if(checkMap[0]!=null && checkMap[0]['password']==pass){
      return true;
    }else return false;
  }
}