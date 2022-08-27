import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Welcome User',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 40),
                RaisedButton(
                  onPressed: () {
                    controller.signInGoogle();
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginScreen();}), ModalRoute.withName('/'));
                  },
                  color: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sign In with Google',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                TextButton(
                    onPressed: () {
                      controller.signOutGoogle();
                    },
                    child: Text("Sign out")),
                const SizedBox(height: 40),
                if (controller.googleUser != null)
                  Text(controller.googleUser!.email),
              ],
            ),
          );
        },
      ),
    );
  }
}
