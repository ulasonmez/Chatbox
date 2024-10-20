import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text("Sign up with Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18))),
          SizedBox(
            height: 15,
          ),
          Text(
            "Get chatting with friends and family today by",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Text(
            "signing up for our chat app!",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Your name",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Your email",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Color(0xFF24786D))),
              )),
          Spacer(
            flex: 3,
          ),
          InkWell(
            onTap: () {
              //create an account
            },
            child: Container(
              width: 327,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFF24786D)),
              child: Center(
                child: Text(
                  "Create an account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
