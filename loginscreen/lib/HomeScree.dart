import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,

          child: Column(
            children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 70,
            ),
            child: DefaultTextStyle(
            style: GoogleFonts.pacifico(
              color: Colors.purple,
            fontSize: 40.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Welcom World'),
                WavyAnimatedText('Flutter  Academy'),
              ],
              isRepeatingAnimation: true,
              onTap: () {
                print("Tap Event");
              },
            ),
      ),
          ),
              Container(

                child: Column(
                  children: [
                   new Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMqQ4JGwBaHFRhrI7iZy267uqhxNPbdiZN7g&usqp=CAU'
                     ,width: 300,
                       height: 250,
                       fit: BoxFit.contain,

                   ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                         horizontal: 50),
                      child: Row(
                        children: [
                          Container(
                              height: 2,
                            width: 300,
                            color: Colors.deepPurple.withOpacity(0.2),
                          ),

                        ],
                      ),

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text('Sign In',
                            style: GoogleFonts.pacifico(
                              color: Colors.white,
                              fontSize: 25

                            ),

                                                  ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen())) ;
                            },

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 2,
                                  color: Colors.black12.withOpacity(0.2),
                                ),

                              ],
                            ),

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            child: Text('Sign up',
                              style: GoogleFonts.pacifico(
                                  color: Colors.white,
                                  fontSize: 25

                              ),

                            ),
                            onTap: (){
                            },

                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
