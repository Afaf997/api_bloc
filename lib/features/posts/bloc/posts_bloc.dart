import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/features/posts/model/data_ui_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
   on<PostinitialFetchEvent>(postinitialFetchEvent);
  }

  FutureOr<void> postinitialFetchEvent(PostinitialFetchEvent event, Emitter<PostsState> emit) async{
    var client = http.Client();
    List<PostResponse>posts =[];
try {
  var response = await client
  .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),);
 
   List result = jsonDecode(response.body);

  for(int i=0; i<result.length; i++){
     PostResponse post =PostResponse.fromJson(result[i] as Map<String,dynamic>);
     posts.add(post);
  }
   print(posts);}
catch(e){
  log(e.toString() as num);
  //
}
  
  }
}
