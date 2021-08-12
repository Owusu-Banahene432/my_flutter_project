import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
    TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Column(
        
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(50, 80, 0.0, 0.0),
                  child: Text('Create New Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0
                  ),
                  )
                ),

              ],
            ),
          ),
         SizedBox(height: 40.0,),
           //thebelowline is a container for holding the email and the password textfield
         Container(
           padding: EdgeInsets.only(top: 35.0, left: 20.0, right:20.0) ,
            child: Column(
              children:  [
                //this is the first container that is the email container
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFF2F2F2),
                    borderRadius: BorderRadiusDirectional.circular(12.0)
                  ),
               child: TextField(
                 controller: _email,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ) 
                  ),
                  ),),
                  SizedBox(height: 20.0,),
                    //this is the second container that is the password container 
                    Container(
                      decoration: BoxDecoration(
                    color: Color(0XFFF2F2F2),
                    borderRadius: BorderRadiusDirectional.circular(12.0)
                  ),
                  child:TextField(
                    controller: _password,
                  decoration: InputDecoration(
                   border: InputBorder.none,
                   contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ) 
                  ),
                  ),
            ),
             //lets introduce another sizedbox
             SizedBox(height:20.0,),
             //container for the button through gesture detector
              Container(
                   height: 60.0,
                   child: Material(
                     borderRadius: BorderRadius.circular(20.0) ,
                     shadowColor: Colors.purpleAccent,
                     color: Colors.purpleAccent,
                     elevation: 8.0,
                     child:GestureDetector(
                       onTap:() async {
                        try {
                          await (FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email.text,
                                  password: _password.text));

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                          _email.text = '';

                          _password.text = '';
                        }
                      },

                       child: Center(
                         child: Text('Create New Account',
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Montserrat'
                         ),
                         ),
                       ),
                       )
                     ),
                 ) ,

            ]
            ),
         ),
         
          Container(
            padding: EdgeInsets.only(top: 250.0, left: 20.0, right:20.0) ,
          
            child: Column(
              children: [
                Container( 
                
                  alignment: Alignment.bottomCenter,
                  height: 60.0,
                  color: Colors.transparent,
                   child: Material(
                     borderRadius: BorderRadius.circular(20.0) ,
                     shadowColor: Colors.transparent,
                     color: Colors.purpleAccent,
                     elevation: 8.0,
                     child:GestureDetector(
                       onTap:(){Navigator.pop(context, '/home');} ,
                       child: Center(
                         child: Text('Back to Login',
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Montserrat'
                         ),
                         ),
                       ),
                       )
                     ),
                 
                )
              ],),
          )
         




         ],
      ),
      

       
    );
  }
}