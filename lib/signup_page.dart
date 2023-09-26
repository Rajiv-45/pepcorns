import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final void Function()? onPressed;
  const SignupPage({super.key, required this.onPressed});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isloading = true;
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      setState(() {
        isloading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isloading = false;
      });
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("The account already exists for that email.")));
        //  print('The account already exists for that email.');
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 115, 227, 173),
        title: Text("SignUp Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: OverflowBar(
            overflowSpacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        "https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2021/11/set-background-image-flutter-hero.jpeg?zoom=2&resize=950%2C500&ssl=1",
                        scale: 0.2)),
              ),
              TextFormField(
                controller: _email,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Email is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: "Email"),
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Password is empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_sharp),
                    labelText: "Password"),
              ),
              SizedBox(
                width: w,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Validation is done");
                      createUserWithEmailAndPassword();
                    }
                  },
                  child: isloading == true
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text("Signup"),
                ),
              ),
              SizedBox(
                width: w,
                height: 45,
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
