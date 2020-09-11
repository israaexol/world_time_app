import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(), //takes the context object as an argument
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
//asynchronous code represents an action that starts now but ends somewhen in the future
//for ex data grabbing after establishing a request

