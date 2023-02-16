import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Nice tab"),
              bottom:  TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.looks_one), child: Text("Screen one")),
                  Tab(icon: Icon(Icons.looks_two), child: Text("Screen two")),
                  Tab(icon: Icon(Icons.looks_3), child: Text("Screen three"))
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Text("This is widget 1"),
                Text("This is widget 2"),
                Text("This is widget 3"),
              ],
            ),
            bottomNavigationBar: Material(
              color: Theme.of(context).colorScheme.primary,
              child: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.looks_one), child: Text("Bottom Screen one")),
                  Tab(icon: Icon(Icons.looks_two), child: Text("Bottom Screen two")),
                  Tab(icon: Icon(Icons.looks_3), child: Text("Bottom  Screen three"))
                ],
              )
            ),
          ));
  }
}
