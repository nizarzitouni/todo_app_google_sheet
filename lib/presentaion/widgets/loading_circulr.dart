import 'package:flutter/material.dart';

class LoadingCirclualr extends StatelessWidget {
  const LoadingCirclualr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
