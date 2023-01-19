import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roadmap/Models/PostModel.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  List<PostModel> postList= [];
  Future<List<PostModel>>getPostApi()async{
    print('hell');
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
print(data);
    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }



  @override
  Widget build(BuildContext context) {

    getPostApi();
    return Scaffold(

      appBar: AppBar(title: Text('Api'),),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
          future: getPostApi(),
              builder: (context,snapshot){
            if(!snapshot.hasData){
              print(snapshot.data);
              return Text('Loading...');
            }else{
              return  ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Tittle\n'+postList[index].title.toString()),
                    Text('Description'+postList[index].body.toString()),
                    Text('userid '+postList[index].userId.toString()),
                      ],),
                    );
                  });

            }
          }),
        )
      ],),

    );

  }
}
