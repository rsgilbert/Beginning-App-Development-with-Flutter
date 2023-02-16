import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Shopping App", initialRoute: "/", routes: {
      "/": (context) => LandingScreen(),
      "/browse": (context) => BrowseScreen(),
      "/product": (context) => productScreen,
      "/help": (context) => helpScreen
    });
  }
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Landing"),
        TextButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) {
                    return CheckoutScreen();
                   }
                )
              );
            },
            child: Text("Checkout")
        ),
        TextButton(
            onPressed: () async {
              dynamic prodCount = await Navigator.pushNamed(context, "/browse");
              print("products browsed for are $prodCount");
            },
            child: Text("Browse products"))
      ],
    );
  }
}

class CheckoutScreen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Text("Checkout");
  }

}
class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Browsing products"),
        TextButton(
          onPressed: () {
            // var pickedProduct = 'Bar of soap';
            Navigator.pop<int>(context, 3);
          }, 
          child: Text("Back")
        )

      ],
    );
  }
}

Widget productScreen = Text("Product X");
Widget helpScreen = Text("Help");
