import 'package:flutter/material.dart';
import 'package:gymshark_clone/core/components.dart/layout.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({required this.pageTitle, super.key});

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double correspondingWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          HeaderRow(
            pageTitle: pageTitle,
            accountInitials: 'JS',
          ),
          Material(
            color: Colors.transparent,
            child: Positioned(
              bottom: 0,
              child: Container(
                width: correspondingWidth,
                height: screenHeight,
                color: Colors.red.withOpacity(0.3),
                child: Center(
                  child:
                      Text('Height: $screenHeight\nWidth: $correspondingWidth'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
