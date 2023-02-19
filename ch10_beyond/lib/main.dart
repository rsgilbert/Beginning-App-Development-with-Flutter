import 'dart:io';

import 'package:ch10_beyond/fut.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(MaterialApp(home:
  Scaffold(body: PeopleWidget())));
  //  Directory s = await getTemporaryDirectory();
  // print("p ${s.absolute}, p2 ${s.path}");
}
