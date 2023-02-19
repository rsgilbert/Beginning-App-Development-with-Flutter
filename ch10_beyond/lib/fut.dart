import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeadlessWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    play();
    return const Center(child: Text("X"));
  }
}

void play() async {
  try {
    Uri url = Uri.parse('http://localhost:4001?filename=Budgets & pies');
    print("uri is $url");
    print("encoded uri is ${Uri.encodeComponent('Budgets&Salaries')}");
    var response = await get(url);
    print("response is ${response.body}");




  } catch (e) {
    print('Error $e');
    rethrow;
  }
}
