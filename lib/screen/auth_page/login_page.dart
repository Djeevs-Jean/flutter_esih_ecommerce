import 'package:flutter/material.dart';
import 'package:bankhoo/services/_auth_services.dart';
import 'package:bankhoo/local/local_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checkbox = true;

  late String _token;
  bool _isloggin = false;

  _postLogin(String username, String password) async {
    final currentuser = await AuthService.postUser(username, password);
    setState(() {
      _token = currentuser!;
    });
  }
  
  // @override
  // void initState() {
  //   // TODO: implement initState 
  //   super.initState();
  //   // _postLogin("mor_2314", "83r5^_");
  //   _postLogin("mor_2314", "83r5^_");
  // }


  // Future<void> _fetchArticles() async {
  //   final articles = await ArticleService.getArticles();
  //   setState(() {
  //     _listArticles = articles as List<Article>;
  //   });
  // }


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _fetchArticles();
  // }

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
                      _postLogin(_usernameController.text, _passwordController.text);
                      setState(() {
                        final user = AuthService.getUser(_usernameController.text);
                        LocalUser.saveUserData(user['id'], user['username'])
                      });
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