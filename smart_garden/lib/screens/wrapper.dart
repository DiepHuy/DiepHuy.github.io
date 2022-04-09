import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_garden/models/user.dart';
import 'package:smart_garden/screens/authenticate/authenticate.dart';
import 'package:smart_garden/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print(user);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
