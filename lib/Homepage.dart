import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Column(
        
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(50, 80, 0.0, 0.0),
                  child: Text('Welcome User \n Login to your account',
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadiusDirectional.circular(12.0)
                  ),
               child: TextField(
                 controller: email,
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
                    controller: password,
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
                     shadowColor: Colors.purpleAccent[100],
                     color: Colors.purpleAccent,
                     elevation: 8.0,
                     child:GestureDetector(
                       onDoubleTap:()async {
                        try {
                          User user = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text)) as User;
                          if (user.email != null) {
                            Navigator.pushNamed(context, '/home');
                          }
                        } catch (e) {
                          print(e);
                          email.text = '';
                          password.text = '';
                        }
                      },
                       child: Center(
                         child: Text('LOGIN',
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
                       onTap:(){Navigator.pushNamed(context, '/Signup');} ,
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
                 
                )
              ],),
          )
         




         ],
      ),
      

    );
  }
}