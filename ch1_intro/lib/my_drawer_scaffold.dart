import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routesMap = {
  // "/": (context) => Text("Home"),
  "/vitaminA": (context) => VitaminAScreen(),
  "/vitaminB": (context) => VitaminBScreen()
};

class VitaminBScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: const Text("This is vitamin B"),
      drawer: MyDrawer()
    );
  }
}


class VitaminAScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: const Text("This is vitamin A"),
      drawer: MyDrawer()
    );
  }
}


class MyDrawerScaffold extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: const Text("This is vitamins"),
      drawer: MyDrawer()
    );
  }
}

var myAppBar = AppBar(
        title: const Text("Vitamins")
);

class MyDrawer extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Icon(Icons.local_hospital, size: 50, color: Colors.red)
                  ),
                  Container(                    
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "My Great Vitamin Business",
                      style: Theme.of(context).textTheme.headline6
                    )
                  )
                ],
                
              )
            ),
            ListTile(
              leading: const Icon(Icons.medical_services_outlined, color: Colors.green),
              title:  const Text("Vitamin A"),
              onTap: () {
                Navigator.pushNamed(context, "/vitaminA");
              }
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.medical_services_outlined, color: Colors.green),
              title:  const Text("Vitamin B"),
              onTap: () {
                Navigator.pushNamed(context, "/vitaminB");
              }
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.medical_services_outlined, color: Colors.green),
              title:  Text("Vitamin C"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.medical_services_outlined, color: Colors.green),
              title:  Text("Vitamin D"),
            ),
            Divider()
          ],
        )
      );
   
  }
}