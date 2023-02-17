import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialogCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( 
        child: MaterialButton(
      color: Theme.of(context).colorScheme.primary,
      textColor: Colors.white,
      onPressed: () async {
        bool? response = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Text("Do you really want to fire a nuclear weapon?"),
                  actions: [
                    TextButton(
                        child: Text("CANCEL"),
                        onPressed: () {
                          print("He wants to cancel");
                          Navigator.pop(context, false);
                        }),
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          print("He said ok");
                          Navigator.pop(context, true);
                        })
                  ]);
            });
        print("Response $response");
        showDialog(context: context, builder: (context) {
          return SimpleDialog(
            title: Container(child: Text("The response was $response"), padding: EdgeInsets.fromLTRB(0,0,0,28))
            // title: Text("Hello",  style: Theme.of(context).textTheme.titleLarge?.merge(TextStyle(fontWeight: FontWeight.bold, color: Colors.black))), 
            // children: [Container(child: Text("The response was $response"), alignment: Alignment.center)]
            );
        });
      },    
      child: const Text("Fire Nuke")
    ));
  }
}
