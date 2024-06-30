import 'package:flutter/material.dart';
import 'package:sample_user_lpgin/class/User.dart';

class UserDetailPage extends StatefulWidget {
  final User user;
  const UserDetailPage({super.key, required this.user});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User ID: ${widget.user.userID}'),
            Text('Username: ${widget.user.username}'),
            Text('Email: ${widget.user.email}'),
            Text('User Type: ${widget.user.userType}'),
            Text('Token: ${widget.user.token}'),
            Text('Name: ${widget.user.name}'),
            Text('Contact Number: ${widget.user.contactNumber}'),
            Text('Status: ${widget.user.status}'),
          ],
        ),
      ),
    ); // Add closing parenthesis here
  }
}
