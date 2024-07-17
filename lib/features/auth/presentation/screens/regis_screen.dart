import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class RegisScreen extends StatelessWidget {
  const RegisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.pushNamed(loginScreen);
              },
              child: const Text("Regis"),
            ),
          ],
        ),
      ),
    );
  }
}
