import 'package:flutter/material.dart';
import 'package:flutter_bloc_app_template/routes/router.dart' as router;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: Stack(
            children: [
              router.destinations[currentIndex].screen,
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: destinations,
            selectedIndex: currentIndex,
            onDestinationSelected: onSelected,
          ),
    );
  }
}
