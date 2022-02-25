import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Them MAin FUnction in FLutter

void main()  {
  //Initialize Flutter Binding
 // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MainConsept(),
      ),
    );
  }
}

class MainConsept extends StatefulWidget {
  const MainConsept({Key? key}) : super(key: key);

  @override
  _MainConseptState createState() => _MainConseptState();
}

class _MainConseptState extends State<MainConsept> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(23),
        child: Column(
          children: [

            //Create Logo Animation in here

            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Image.asset('assets/logo.gif'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("PC", style: TextStyle(color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold),),
                  Text("Secure", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),)
                ],
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email address'
              ),
              controller: emailController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password'
              ),
              controller: passwordController,
              obscureText: true,
            ),

            //Buttons for Sign in

            Container(
              margin: EdgeInsets.only(top: 23),
              decoration: const BoxDecoration(
                color: Colors.black
              ),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Colors.black,
                child: const Text("Login", style: TextStyle(color: Colors.white),),
                onPressed: (){

                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(23),
              child: Text("OR"),
            ),

            //Button for Sign up
            Container(
              decoration: const BoxDecoration(
                  color: Colors.green
              ),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Colors.green,
                child: const Text("Register", style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  print("Button Clicked!");
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);

                setState(() {});

                },
              ),
            ),

            const SizedBox(
              height: 23,
            ),
          /*  TextButton(onPressed: (){},
                child: const Text("Sign out", style: TextStyle(color: Colors.orange),)) */

          ],
        ),
      ),
    );
  }
}

