import 'package:flutter/material.dart';
import  'package:cloud_firestore/cloud_firestore.dart';


 class Home extends StatelessWidget {
  final CollectionReference _info = FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          FutureBuilder(
            future: _info.get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> shots){
                if(shots.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if(shots.connectionState == ConnectionState.done){
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child:
                    GridView.count(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 2,
                      crossAxisCount: 2,
                      children: <Widget> [
                        ...shots.data!.docs.map((documents) {
                              return Card(
                                elevation: 4,                              
                                child: Column(                    
                                  children: [
                                    Image.network('${documents["Images"]}',
                                    height: 40.0,
                                    width: 30.0,),
                                    Row(
                                      children: [
                                        Text('${documents["name"]}'),
                                        Spacer(),
                                        Text('${documents["size"]}'),
                                      ],
                                    )
                                    
                                  ],
                                ),
                              ); 
                        }).toList()
                      ],
                    ),
                  );
                }
                return Center(child: Text('${shots.hasError}'),);

            })
        ],
      )
    );
    
  }
}