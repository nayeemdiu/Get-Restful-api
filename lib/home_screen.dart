import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/PostModes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModels> postList = [];
  //Feture use to data get api
  Future<List<PostModels>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostModels.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API HOME PAGE'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loding");
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          // list view te card add hobe
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 
                                  Text('Title',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: (Colors.deepOrangeAccent)),),
                                  Text(postList[index].title.toString()),
                                  SizedBox(height: 15,),
                                  Text('Decribe',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: (Colors.purple)),),
                                  Text(postList[index].body.toString())
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
