import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:navttac2/Screen2.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedAccount = "Student";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/navttc_logo.png',
                    height: 100,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Flowing accounts have been registered with this mobile no',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: selectedAccount,
                    children: {
                      'Institute': Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Institute'),
                      ),
                      'Instructor': Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Instructor'),
                      ),
                      'Monitoring': Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Monitoring'),
                      ),
                      'Student': Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Student'),
                      ),
                    },
                    onValueChanged: (String? value) {
                      setState(() {
                        selectedAccount = value ?? selectedAccount;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Your email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),
                        Text("Remember Me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement Forgot Password functionality
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        // Implement Login functionality
                        String email = emailController.text;
                        String password = passwordController.text;
                        String accountType = selectedAccount;

                        // Print values to console for now
                        print("Email: $email");
                        print("Password: $password");
                        print("Account Type: $accountType");

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MonitoringScreen(),
                            ));

                        // // Add your login logic here
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTypeButton(String accountType) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedAccount = accountType;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selectedAccount == accountType ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              accountType,
              style: TextStyle(
                color: selectedAccount == accountType
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
