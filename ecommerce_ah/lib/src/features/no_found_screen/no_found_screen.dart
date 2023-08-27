import 'package:ecommerce_ah/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class NoFoundScreen extends StatelessWidget {
  const NoFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('404 - Page Not Found'),
            gapH8,
            TextButton(onPressed: () {}, child: Text('Go To Home'))
          ],
        ),
      ),
    );
  }
}
