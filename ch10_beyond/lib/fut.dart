import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class PeopleWidget extends StatelessWidget {
  Uri url = Uri.parse("http://localhost:4002/people");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: get(url),
        builder: (BuildContext ctx, AsyncSnapshot<Response> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const Text("Nothing to show");
          }
          // snapshot.
          var body = snapshot.data?.body;
          if (body == null) return const Text("Null response body");
          print("body is $body");
          final List people = jsonDecode(body);
          print("People $people");
          return ListView(
              children: people
                  .map((person) => (Column(children: [
                        ListTile(
                          title: Text(person['first']),
                          subtitle: Text(person['last']),
                        ),
                        const Divider()
                      ])))
                  .toList());
        });
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
