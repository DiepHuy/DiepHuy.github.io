import 'package:flutter/material.dart';
import 'package:smart_garden/services/auth.dart';
import 'package:smart_garden/shared/constants.dart';
import 'package:smart_garden/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Smart Garden'),
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white70),
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              //gmail enter box
              SizedBox(height: 10.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              //password enter box
              SizedBox(height: 10.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) =>
                    val!.length < 10 ? 'Enter a password 10+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 85, 66, 68)),
                ),
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result =
                        await _auth.singInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Account do not exist';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
