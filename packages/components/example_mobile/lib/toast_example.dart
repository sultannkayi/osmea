import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ToastExamplePage extends StatelessWidget {
  const ToastExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toast Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => OsmeaComponents.showToast(
                context: context,
                message: 'Operation successful!',
                type: ToastType.success,
                position: ToastPosition.bottom,
                animation: ToastAnimation.slide,
              ),
              child: const Text('Success Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => OsmeaComponents.showToast(
                context: context,
                message: 'An error occurred!',
                type: ToastType.error,
                position: ToastPosition.top,
                animation: ToastAnimation.fade,
              ),
              child: const Text('Error Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => OsmeaComponents.showToast(
                context: context,
                message: 'Warning message!',
                type: ToastType.warning,
                position: ToastPosition.center,
                animation: ToastAnimation.scale,
              ),
              child: const Text('Warning Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => OsmeaComponents.showToast(
                context: context,
                message: 'Information message.',
                type: ToastType.info,
                position: ToastPosition.bottom,
                animation: ToastAnimation.slide,
              ),
              child: const Text('Info Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
