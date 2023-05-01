import 'package:flutter/material.dart';
import 'package:bankhoo/services/_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checkbox = true;

  late String _token;

  _postLogin(String username, String password) async {
    final currentuser = await AuthService.postUser(username, password);
    setState(() {
      _token = currentuser!;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postLogin("mor_2314", "83r5^_");
  }


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
          // key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),

              const SizedBox(height: 15,),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Password"),
                obscureText: true,
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

                  }, child: Text("Se Connecter")),
                  ElevatedButton(onPressed: () {}, child: Text("Creer un Compte"))
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