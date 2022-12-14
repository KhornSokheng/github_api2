import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class showProgressIndicator extends StatelessWidget {
  const showProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPouringHourGlassRefined(
        size: 80,
        color: Colors.blue,
        duration: Duration(milliseconds: 1200),
      ),
    );
  }
}

class showEmptySearchResult extends StatelessWidget {
  const showEmptySearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Result...",
        style: TextStyle(
          fontSize: 20,

        ),
      ),
    );
  }
}

