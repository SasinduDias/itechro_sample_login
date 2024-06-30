import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sample_user_lpgin/class/User.dart';
import 'package:sample_user_lpgin/screens/userDetailPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<User?> loginUser(String username, String password) async {
    final url = Uri.parse('https://podijobs.cmit.lk/api/login_user.php');

    final body = json.encode({
      'username': username,
      'password': password,
      'userType': 'SUPPLIER',
    });

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return User.fromJson(responseData['user']);
    } else {
      // ignore: avoid_print
      print('Login failed: ${response.body}');
    }
  }

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        height = constraints.maxHeight;
        width = constraints.maxWidth;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: height * 1,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 8, 194, 116),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.3, left: width * 0.1),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Color.fromARGB(255, 243, 235, 235),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height * 0.4, // Adjust the value to control the overlap
                left: width * 0.1,
                right: 0,

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 500,
                  child: Container(
                    height: height * 0.7,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 119, 240, 193),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(right: height * 0.05),
                      margin: EdgeInsets.only(
                          top: height * 0.05, left: width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 24, 23, 23),
                            ),
                          ),
                          TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter User ID or Email',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 161, 157, 157),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 24, 23, 23),
                            ),
                          ),
                          TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 161, 157, 157),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 23, 24, 23),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // add check box
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  const Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 23, 24, 23),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // add button
                              ElevatedButton(
                                onPressed: () async {
                                  final user = await loginUser(
                                      _usernameController.text,
                                      _passwordController.text);
                                  if (user != null) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserDetailPage(user: user),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 8, 194, 116),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 243, 235, 235),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //add horizontal line
                          Container(
                            height: 1,
                            width: width * 0.8,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //add google icon
                              Image.asset(
                                'assets/google.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text("or"),
                              const SizedBox(
                                width: 20,
                              ),
                              //add facebook icon
                              Image.asset(
                                'assets/apple.png',
                                height: 50,
                                width: 50,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
