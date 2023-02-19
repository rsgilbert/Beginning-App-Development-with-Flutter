void main() async {
  Future myFuture = new Future(() {
    print("Hey you!");
    return 1;
  });
  myFuture.then((value) {
    print("The value is $value");
  });
  int n = await myFuture;
  print("n is $n");
}
