import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HeadlessWidget extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    play();
    return Center(child: Text("X"));
  }
}

void play() async {
  try {
    String data = await rootBundle.loadString('assets/database.json');
    debugPrint(data);
    var m = jsonDecode(data);
    print("name is ${m['name']}");

    var mp2 = { 'first': 'Jack', 'last': 'Bauer'};
    var s = json.encode(mp2);
    debugPrint(s);
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('age', 25);
    int? meaning = sp.getInt('age');
    print('meaning of life is $meaning');



  } catch (e) {
    print('Error $e');
    rethrow;
  }
}
