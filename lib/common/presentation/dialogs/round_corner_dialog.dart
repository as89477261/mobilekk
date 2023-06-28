import 'package:flutter/material.dart';

class RoundCornerDialog extends StatelessWidget {
  final Widget child;

  const RoundCornerDialog({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 32,
              ),
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
