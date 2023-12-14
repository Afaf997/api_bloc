import 'package:flutter/material.dart';
import 'package:rest_api/features/posts/bloc/posts_bloc.dart';

class Postpage extends StatefulWidget {
  const Postpage({super.key});

  @override
  State<Postpage> createState() => PostpageState();
}

class PostpageState extends State<Postpage> {
  final PostsBloc postbloc =PostsBloc();
  @override
  void initState() {
   postbloc.add(PostinitialFetchEvent(),
   );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post Pages",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500,color: Colors.white),),
        backgroundColor: Colors.purple[300],
      ),
    );
  }
}