import 'package:flutter/material.dart';

class NetworkBanner extends StatelessWidget {
  final String message;
  final bool isOnline;

  const NetworkBanner({Key? key, required this.message, required this.isOnline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      color: isOnline ? Colors.green : Colors.red,
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
