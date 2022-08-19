import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//------------------------------------------------------------------------
class DatabaseConnection{

  static Database?  _db;
//-------------------------------
  Future<Database?> get db async{
    if(_db == null){
      _db = await intialDb();
      return _db;
    }
    else{
      return _db;
    }
  }
//-------------------------------
  intialDb()async{
    String databasepath=await getDatabasesPath();
    String path=join(databasepath,'noteapp.db');
    Database mydb=await openDatabase(path,onCreate:_onCreate,version: 1);
    print('open DB');
    return mydb;
  }
  //----------------------------------
  Future<void> _onCreate(Database db ,int version)async {
    db.execute('''
        CREATE TABLE note
        (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
       contact Text NOT NULL,
       description TEXT NOT NULL,
        date TEXT NOT NULL
        )''').then((value)=>print('') )
        .catchError((onError)=>print("---------||||||-------------${onError.toString}-----------||||||-----------"));
  }
}
