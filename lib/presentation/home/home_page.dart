import 'package:flutter/material.dart';
import 'package:state_management/domain/auth/model/login_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.loginResponse});

  final LoginResponse loginResponse;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.loginResponse.token.toString()),
      ),
    );
  }
}
