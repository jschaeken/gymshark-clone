import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/layout.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderRow(
            pageTitle: pageTitle,
            accountInitials: 'JS',
          ),
        ],
      ),
    );
  }
}
