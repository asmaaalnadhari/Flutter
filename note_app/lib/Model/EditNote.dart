import 'package:flutter/material.dart';
import '../db_helper/repository.dart';
//-------------------------------------------------------
class EditNote extends StatefulWidget {
  final String OldContact ,ConcatController,descriptionController;
  EditNote(
      {required this.ConcatController,
        required this.descriptionController ,
        required this.OldContact}
      );
  @override
  State<EditNote> createState() => _EditNoteState();
}
//---------------------------------------------------------
class _EditNoteState extends State<EditNote> {
  //------------------------------------------------------
  late TextEditingController noteContactController =
  TextEditingController(text: widget.descriptionController);
  late TextEditingController _noteDescriptionController =
  TextEditingController(text: widget.ConcatController);
  late String OldContact =widget.OldContact;
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
                'Edit New User',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: noteContactController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Write Your Note',
                    labelText: 'Note',
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
                    hintText: 'Write Description',
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
                          noteContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _noteDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;

                        });
                        if (
                        _validateContact == false &&
                            _validateDescription == false) {
                          // print("Good Data Can Save");
                          DB.updateData(
                              contact: noteContactController.text,
                              description: _noteDescriptionController.text,
                              oldcontact: OldContact
                          ).then((value) {
                            var result=value;
                            setState(() {
                              Navigator.pop(context);
                              print('done update $result');

                            });
                          });

                        }
                      },
                      child: const Text('Update Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        noteContactController.clear();
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