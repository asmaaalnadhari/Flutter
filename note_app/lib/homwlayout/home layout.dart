//--------------------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/AddNote.dart';
import '../Model/EditNote.dart';
import '../Model/ViewNote.dart';
import '../db_helper/repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//---------------------------------------------------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(mapping.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App "),
        centerTitle: true,
        leading: Icon(Icons.notes),
      ),
      //-----------------------------
      body: ListView.builder(
          itemCount: mapping.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //--------------------
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewNote(
                            mapping:mapping[index],
                          )));
                             },
                //--------------------
                leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.purple,
                  child: Text('${index+1}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                    ),),
                ),
                title: Text(mapping[index]['contact'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${mapping[index]['description']} '),
                    SizedBox(height: 2,),
                    Text('${mapping[index]['date']}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditNote(
                                      ConcatController: mapping[index]['contact'],
                                      OldContact: mapping[index]['contact'],
                                      descriptionController: mapping[index]['description'],
                                    ))).then((data) {
                              if (data != null) {
                                setState(() {
                                  showSuccessSnackBar(
                                      'Note Detail Updated Success'
                                      ,Colors.green);
                                });
                              }});
                            },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.green,
                        )),
                    //-------------------------------
                    IconButton(
                        onPressed: () {
                          setState(() {
                            deleteFormDialog(context, mapping[index]['id']);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()))
              .then((data) {
            if (data != null) {
              setState(() {
                showSuccessSnackBar('Note Detail Added Success',Colors.green);
                DB.readData('SELECT * FROM note'
                ).then((value) {
                  mapping =value;
                });
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}