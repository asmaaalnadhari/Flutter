import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'database_connection.dart';
List< Map<dynamic, dynamic>> mapping=[];

class Repository {
  late   DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection= DatabaseConnection();
  }

  Future<int> insertData({
    required String contact,
    required String description } )async{
    Database? mydb =await _databaseConnection.db;
    int response = await mydb!.rawInsert(
        ''' INSERT INTO note (contact ,description,date) 
        VALUES('$contact' ,'$description','${DateFormat.yMMMd().format(DateTime.now()) }'
        )'''
    );
    print("\n\n\n###################Insert#################\n\n\n");
    return response;
  }
  Future<List<Map>> readData(String sql)async{
    Database? mydb= await _databaseConnection.db;
    List<Map> response =await mydb!.rawQuery(sql);
    return response;
  }


  updateData({ required String contact,required String description ,required String oldcontact} )async{
    Database? mydb =await _databaseConnection.db;
    int response =await mydb!.rawUpdate('''
    UPDATE note SET
     contact = '$contact',
      description = '$description'
       WHERE contact = '$oldcontact'
       ''');
    return response;
  }
  Future<int> deleteDataById(table, itemId) async {
    var connection = await  _databaseConnection.db;
    return  connection!.delete(table ,where: itemId);
  }
}
//-----------------------------------------------------
showSuccessSnackBar(String message,Color bgColor) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
Repository DB = Repository();
//--------------------------------------------------
deleteFormDialog(BuildContext context, NoteId) {
  return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text(
            'Are You Sure to Delete',
            style: TextStyle(color: Colors.purple, fontSize: 20),
          ),
          actions: [
                  TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white, // foreground
                    backgroundColor: Colors.red),
                onPressed: ()  {
                  DB.deleteDataById('note',NoteId
                    ).then((value) {
                      if (value != null) {
                        Navigator.pop(context);
                        showSuccessSnackBar(
                            'Note Detail Deleted Success',Colors.green);
                      }});
                },
                child: const Text('Delete')),
                 //----------------------------------------
                 TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white, // foreground
                    backgroundColor: Colors.purple),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
      });
}