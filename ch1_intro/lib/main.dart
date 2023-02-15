import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(FancyHelloWidget());
}

class Person extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String middleName;
  Person(this.middleName, {required this.firstName, required this.lastName}) {}

  Widget build(BuildContext context) {
    return Text("I am $firstName");
  }
}

class FancyHelloWidget extends StatelessWidget {
  String _searchTerm = "";
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("A Fancy Hello App")),
        body: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Person("Peterson", firstName: "Joyce", lastName: "Namuli"),
              TextField(
                controller: _controller,
                onChanged: (String val) => _searchTerm = val,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[1-5]')),
                  FilteringTextInputFormatter.deny(RegExp('2')),
                  LengthLimitingTextInputFormatter(4)
                ],
                decoration: InputDecoration(
                    labelText: "Credit Card", counterText: "ABC"),
              ),
              Checkbox(value: false, onChanged: (val) => print('Val is $val')),
              Switch(
                value: true,
                onChanged: (val) => print('switch new val is $val'),
              ),
              MyRadioWidget(),
              MySliderWidget(),
              MyDropdownMenu()
            ])),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
      ),
    );
  }
}

class MyDropdownMenu extends StatelessWidget {
  ClothSize _clothSize = ClothSize.SMALL;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<ClothSize>(
        value: _clothSize,
        items: <DropdownMenuItem<ClothSize>>[
          DropdownMenuItem(child: Text(ClothSize.SMALL.name), value: ClothSize.SMALL),
          DropdownMenuItem(child: Text(ClothSize.MEDIUM.name), value: ClothSize.MEDIUM),
          DropdownMenuItem(child: Text(ClothSize.LARGE.name), value: ClothSize.LARGE),
          DropdownMenuItem(child: Text(ClothSize.EXTRALARGE.name), value: ClothSize.EXTRALARGE),
        ],
        onChanged: (val) => {});
  }
}

class MySliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slider(value: 2, min: 1, max: 10, onChanged: (val) => {});
  }
}

enum ClothSize { SMALL, MEDIUM, LARGE, EXTRALARGE }

class MyRadioWidget extends StatelessWidget {
  ClothSize? _clothSize = ClothSize.MEDIUM;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Radio<ClothSize>(
              groupValue: _clothSize,
              value: ClothSize.SMALL,
              onChanged: (val) => _clothSize = val),
          Text("SMALL")
        ]),
        Row(children: [
          Radio<ClothSize>(
              groupValue: _clothSize,
              value: ClothSize.MEDIUM,
              onChanged: (val) => _clothSize = val),
          Text(ClothSize.MEDIUM.name)
        ]),
        Row(children: [
          Radio<ClothSize>(
              groupValue: _clothSize,
              value: ClothSize.LARGE,
              onChanged: (val) => _clothSize = val),
          Text(ClothSize.LARGE.name)
        ]),
        Row(children: [
          Radio<ClothSize>(
              groupValue: _clothSize,
              value: ClothSize.EXTRALARGE,
              onChanged: (val) => _clothSize = val),
          Text(ClothSize.EXTRALARGE.name)
        ])
      ],
    );
  }
}
