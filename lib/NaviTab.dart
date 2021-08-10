import 'package:flutter/material.dart';
import 'package:shoeapp/home_screen.dart';
import 'package:shoeapp/search_screen.dart';
import 'package:shoeapp/saved_screen.dart';
import 'package:shoeapp/logout_screen.dart';

class Nav extends StatefulWidget {
  Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex=0;
  List<Widget>_widgetOptions =<Widget>[
    Home(),
    Search(),
    Saved(),
    Logout(),
  ];
  void _onItemTap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        // title: Text('Productive page'),
      // ),
       body: Center(
         child: _widgetOptions.elementAt(_selectedIndex)),
       bottomNavigationBar: BottomNavigationBar(
         items: const<BottomNavigationBarItem>[
           BottomNavigationBarItem(

             icon: Icon(Icons.home, color: Colors.black, size: 30,),
             backgroundColor: Colors.grey,
            label: 'Home',),

            //search item on the navigation bar
             BottomNavigationBarItem(
             icon: Icon(Icons.search,
              color: Colors.black,size: 30,),
             backgroundColor: Colors.grey,
            label: 'Search',),

            //saved item on the navigation tab
             BottomNavigationBarItem(
             icon: Icon(Icons.save,color: Colors.black,size: 30,),
             backgroundColor: Colors.grey,
            label: 'Saved',),

            //logout tab on the naviigationtab
             BottomNavigationBarItem(
             icon: Icon(Icons.logout,color: Colors.black, size: 30,),
             backgroundColor: Colors.grey,
            label: 'Logout',),
           
       ],
       //selectedLabelStyle: TextStyle(fontSize: 22),
          //selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
       ),
    );
  }
}