import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  final String id;

  const DocumentScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Document $id'),
      ),
    );
  }
}
