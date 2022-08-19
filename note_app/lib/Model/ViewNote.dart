import 'package:flutter/material.dart';
class ViewNote extends StatefulWidget {
  final Map mapping;
  const ViewNote({Key? key, required this.mapping}) : super(key: key);
  @override
  State<ViewNote> createState() => _ViewNoteState();
}
//---------------------------------------------------------------
class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Note App "),
          centerTitle: true,
          leading: Icon(Icons.notes),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Details :",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Number :',
                      style: TextStyle(color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text('${widget.mapping['id']}'
                        , style: TextStyle(fontSize: 16,color: Colors.green)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Note:',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(widget.mapping['contact'],
                        style: TextStyle(fontSize: 16,color: Colors.green)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Description :',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.mapping['description']?? '',
                      style: const TextStyle(fontSize: 16,color: Colors.green)),
                ],
              )
            ],
          ),
        ));
  }
}