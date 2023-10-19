import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/layout.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
