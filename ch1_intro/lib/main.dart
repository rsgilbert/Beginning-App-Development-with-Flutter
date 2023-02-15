import 'package:flutter/material.dart';

void main() {
  runApp(FancyHelloWidget());
}

class FancyHelloWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("A Fancy Hello App")
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text("Heyyy!!"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.thumb_up),
          onPressed: ()=>{},
        ),
      ),

    );
  }
}

