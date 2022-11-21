import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[500],
        child: const Center(
          child: Text(
            "Page Not Found!",
            style: TextStyle(
              fontSize: 20,

            ),
          ),
        ),
      ),
    );
  }
}
