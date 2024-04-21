import 'package:flutter/cupertino.dart';

class EnflyPage extends StatelessWidget {
  final Widget child;
  final String name;

  const EnflyPage({Key? key, required this.child, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
