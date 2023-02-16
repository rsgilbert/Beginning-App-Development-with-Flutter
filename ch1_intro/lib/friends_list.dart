import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsList extends StatelessWidget {
  List<Map> fetchPeople() {
    return [
      {"first": "Jack", "last": "Bauer"},
      {"first": "Tom", "last": "Landers"},
      {"first": "Angel", "last": "Michael"}
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _friends = fetchPeople();
    return ListView(
      children: _friends
          .map((person) => GestureDetector(
              onTap: () {
                String msg = "${person['first']} ${person['last']}";
                final SnackBar sb = SnackBar(
                  content: Text(msg),
                  duration: Duration(seconds: 5),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: "YEY!",
                    onPressed: (){ print("Yeyyed!"); },
                  )
                );
                ScaffoldMessenger.of(context).showSnackBar(sb);
                // Scaffold.of(context);

                print("tapped");
              },
              child: Dismissible(
                  key: Key(person['first']),
                  child: Person(
                      firstName: person['first'], lastName: person['last']))))
          .toList(),
    );
  }
}

class Person extends StatelessWidget {
  final String firstName;
  final String lastName;
  Person({required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration:
            const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        child: Text("I am $firstName $lastName"));
  }
}
