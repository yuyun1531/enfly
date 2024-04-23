import 'package:flutter/cupertino.dart';

class EnflyPage extends StatelessWidget {
  final Widget child;
  final String name;

  const EnflyPage({Key? key, required this.name, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
