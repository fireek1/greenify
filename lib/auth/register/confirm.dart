import 'package:flutter/material.dart';

import 'package:greenify/auth/elements/back_button.dart';

class Confirm extends StatelessWidget {
  const Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 8),
          child: Column(
            children: [BackButtonMenu(), Text('Подтвердите почту')],
          ),
        ),
      ),
    );
  }
}
