import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginscreen/Signup.dart';
import 'package:loginscreen/restartpassword.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: Colors.deepPurple.withOpacity(0.2),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding:EdgeInsetsDirectional.only(
                    start: 15
                  ),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Sign In',style: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),),
                ),
                SizedBox(
                  height: 150,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin:EdgeInsets.symmetric(
                        horizontal: 30
                    ) ,
                    child: Center(
                      child: Row(
                        children: [
                          Image.network('https://png.pngtree.com/png-vector/20220702/ourmid/pngtree-internet-theme-gadget-vector-art-png-image_5671172.png',width: 200,height: 200,),
                        SizedBox(width: 10,),
                          Container(
                            height: 150,
                            width: 2,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 240,
                           height: 200,
                           color: Colors.white.withOpacity(0.4),
                           child: Column(
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children: [
                                Container(
                                  //----------------------------------------------------
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple.withOpacity(0.1),
                                      border: Border(
                                        left: BorderSide(color: Colors.deepPurple,width: 10),
                                      ),
                                    ),
                                    //----------------------------------------------------
                                    width: 220,
                                    height: 50,
                                    //----------
                                    child:TextFormField(
                                      style: GoogleFonts.pacifico(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      //----------------------------------
                                      keyboardType:TextInputType.emailAddress ,
                                      //----------------------------------
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      //-----------------------------------
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.person,color:Colors.purple),
                                        border: InputBorder.none,
                                        hintText: 'email@gmaail.com',
                                        hintStyle: GoogleFonts.pacifico(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        ),
                                        fillColor: Colors.black12.withOpacity(0.2),
                                        filled: true,

                                        //-----------------------------------

                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  //----------------------------------------------------
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple.withOpacity(0.1),
                                      border: Border(
                                        left: BorderSide(color: Colors.deepPurple,width: 10),
                                      ),
                                    ),
                                    //----------------------------------------------------
                                    width: 220,
                                    height: 50,
                                    //----------
                                    child:TextFormField(
                                      style: GoogleFonts.pacifico(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      //----------------------------------
                                      keyboardType:TextInputType.visiblePassword ,
                                      //----------------------------------
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      //-----------------------------------
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock,color:Colors.purple),
                                        border: InputBorder.none,
                                        hintText: '***Passwor***',
                                        hintStyle: GoogleFonts.pacifico(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                        ),
                                        fillColor: Colors.black12.withOpacity(0.2),
                                        filled: true,

                                        //-----------------------------------

                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:100 ,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: MaterialButton(
                                      hoverColor: Colors.purple,
                                      color: Colors.green,
                                      onPressed: (){},
                                      child: Text('Login'
                                        ,style: GoogleFonts.pacifico(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      )),
                                )
                              ],

                            ),
                         ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //-------------------------
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUp()));

                      },
                      child: Text('Sign up',style: GoogleFonts.pacifico(
                        color: Colors.black54,
                        fontSize: 15.0,
                      ),),

                    ),
                    SizedBox(width: 2,),
                    Text('OR',
                      style: GoogleFonts.pacifico(
                      color: Colors.green,
                      fontSize: 18.0,
                    ),),
                    SizedBox(width: 2,),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Restartpassword()));
                      },
                      child: Text(' Forget Password?',style: GoogleFonts.pacifico(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),),

                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
