import 'package:flutter/material.dart';
import 'package:trilling_web/features/client_feature/domain/entities/client.dart';

class NewOrderPage extends StatelessWidget {
  final Client client;
  const NewOrderPage({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
