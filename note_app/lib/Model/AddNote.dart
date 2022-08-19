
import 'package:flutter/material.dart';
import '../db_helper/repository.dart';
//--------------------------------------------
class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);
  @override
  State<AddNote> createState() => _AddNoteState();
}
//----------------------------------------------------
class _AddNoteState extends State<AddNote> {
  //------------------------------------------------------
  var _noteContactController = TextEditingController();
  var _noteDescriptionController = TextEditingController();
  bool _validateContact = false;
  bool _validateDescription = false;
  //------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note App "),
        centerTitle: true,
        leading: Icon(Icons.notes),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Your Note',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _noteContactController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Note',
                    labelText: 'Note..',
                    errorText: _validateContact
                        ? 'Contact Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _noteDescriptionController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Description',
                    labelText: 'Description',
                    errorText: _validateDescription
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.purple,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _noteContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _noteDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;

                        });
                        if (
                        _validateContact == false &&
                            _validateDescription == false) {
                          DB.insertData(
                              contact: _noteContactController.text,
                              description: _noteDescriptionController.text
                          ).then((value) {
                            var result=value;
                            //-----------------------------------
                            setState(() {
                              Navigator.pop(context,result);
                            });
                            print('done insert $result');
                          });
                          //   var result=await _userService.SaveUser(_user);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _noteContactController.clear();
                        _noteDescriptionController.clear();
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}