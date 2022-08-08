import 'package:flutter/material.dart';


class Restartpassword extends StatelessWidget {
  const Restartpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            color: Colors.deepPurple.withOpacity(0.2),
            width: double.infinity,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 300,
                decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            //----------------------------------------------------
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.1),
                                border: const Border(
                                  left: BorderSide(
                                      color: Colors.deepPurple, width: 10),
                                ),
                              ),
                              //----------------------------------------------------
                              width: 300,
                              height: 50,
                              //----------
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20.0,
                                ),
                                //----------------------------------
                                keyboardType: TextInputType.text,
                                //----------------------------------
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                //-----------------------------------
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_open_sharp,
                                      color: Colors.purple),
                                  border: InputBorder.none,
                                  hintText: '***New Password***',
                                  hintStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.black12.withOpacity(0.2),
                                  filled: true,

                                  //-----------------------------------
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            //----------------------------------------------------
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(0.1),
                                border: const Border(
                                  left: BorderSide(
                                      color: Colors.deepPurple, width: 10),
                                ),
                              ),
                              //----------------------------------------------------
                              width: 300,
                              height: 50,
                              //----------
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20.0,
                                ),
                                //----------------------------------
                                keyboardType: TextInputType.text,
                                //----------------------------------
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                //-----------------------------------
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline,
                                      color: Colors.purple),
                                  border: InputBorder.none,
                                  hintText: '***Confirm Password***',
                                  hintStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.black12.withOpacity(0.2),
                                  filled: true,

                                  //-----------------------------------
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: MaterialButton(
                                minWidth: 130,
                                hoverColor: Colors.purple,
                                color: Colors.green,
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen())) ;
                                },
                                child: const Text(
                                  'Restart ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -40),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          // margin: EdgeInsetsDirectional.only(start: 165, top: 210),
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.3),
                            radius: 30,
                            child: const Icon(
                              Icons.lock,
                              size: 60,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}