import 'package:flutter/material.dart';
class Logout extends StatefulWidget {
  Logout({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Container(
                     height: 60.0,
                     child: Material(
                       borderRadius: BorderRadius.circular(20.0) ,
                       shadowColor: Colors.purpleAccent,
                       color: Colors.purpleAccent,
                       elevation: 8.0,
                       child:GestureDetector(
                         onTap:(){
                           





                         } ,
                         child: Center(
                           child: Text('LOGOUT',
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'Montserrat'
                           ),
                           ),
                         ),
                         )
                       ),
                   ),
     ),
    );

  }
  Future<void> showAlertDialog() async{
   return showDialog(context: context,
   barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text('Do you want to exit this application?'),
        content: Text('We hate to see you leave...'),

        actions: <Widget> [
          TextButton(onPressed: (){},
            child: Text('Yes')),
            TextButton(onPressed: (){},
            child: Text('No'))
          
        ],
      );

    });

  }
}