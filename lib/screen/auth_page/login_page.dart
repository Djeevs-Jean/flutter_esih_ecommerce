import 'package:flutter/material.dart';
import 'package:bankhoo/services/_auth_services.dart';
import 'package:bankhoo/local/user_preference.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}):super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _usernameText = "";
  final String _passwordText = "";

  bool checkbox = true;
  bool _token = false;


  _processLogin(username, password) async {
    _postLogin(username, password);
    // if (_token) {
    final user = await AuthService.getInfoUser(username);
    print("current user $user");
    UserPreferences.login(user!);
    var id = await UserPreferences.getUserId();
    var usernam = await UserPreferences.getUsername();
    print('id $id');
    print('usernam $usernam');
    // print("user info $user");
      

    // }
    // Navigator.push(context, route)
  }

  _postLogin(String username, String password) async {
    final token_id = await AuthService.postUser(username, password);
    setState(() {
      if (token_id != null) {
        print("token $token_id");
        _token = true;
      }
    });
  }
  
  var titlePage = "Login Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titlePage)),
      body: Center(
        child: Container(
        padding: EdgeInsets.all(20),
        child: Form(  
          
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(hintText: "Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un username';
                  } 
                  return null;
                },
              ),

              const SizedBox(height: 15,),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  } 
                  return null;
                },
              ),

              const SizedBox(height: 15,),

              Row(
                children: [
                  Checkbox(value: checkbox, onChanged: ((value) => setState(() {
                    checkbox = value!;
                  })) ),

                  const Text("Remember")
                ],
              ),

              const SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _processLogin(_usernameController.text, _passwordController.text);
                    }
                  }, child: const Text("Se Connecter")),
                  ElevatedButton(onPressed: () {}, child: const Text("Creer un Compte"))
                ],
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var titlePage = "Register Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titlePage)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(titlePage),
          ),
        ],
      )
    );
  }
}