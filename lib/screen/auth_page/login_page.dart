import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/service/api_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/main.dart';
import 'package:flutter_ecommerce/notifier_chg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}):super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = "";
  bool _progressBar = false;

  void _navigateToLoginSucces() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => _LoginSucces()));
  }
  
  var titlePage = "Login Page";

  @override
  Widget build(BuildContext context) {
    MyAppStateNotifier appState = context.watch<MyAppStateNotifier>();
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

              // Row(
              //   children: [
              //     Checkbox(value: checkbox, onChanged: ((value) => setState(() {
              //       checkbox = value!;
              //     })) ),

              //     const Text("Remember")
              //   ],
              // ),

              const SizedBox(height: 15,),
              _progressBar ? const LinearProgressIndicator() : Text(_error, style: TextStyle(color: Colors.red, fontSize: 22),),

              const SizedBox(height: 15,),
              ElevatedButton(onPressed: () async {
                print("clik");
                setState(() {
                  _progressBar = true;
                });
                if (_formKey.currentState!.validate()) {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  Map<String, String> loginInfo = {"username":username, "password":password};
                  bool response = await APIService.login(loginInfo);
                  print("User connected $response");
                  if (response) {
                    dynamic user = await APIService.getUser(username);
                    await appState.login(user);
                    setState(() {
                      _error = "";
                    });
                    _navigateToLoginSucces();
                  } else {
                    setState(() {
                      _error = "Username or password incorrect";
                    });
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data is not correct")));
                }
                setState(() {
                  _progressBar = false;
                });
              }, child: const Text("Se Connecter")),
            ],
          ),
        ),
      ),
      )
    );
  }
}

class _LoginSucces extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    TextStyle appbarStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    const textStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Login",style: appbarStyle,),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.green,
                child : Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text("Connected",style: textStyle,),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width/2, 50),
                      shape : ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (ctx){ return MainScreen();}
                      )
                    );
                  },
                  child: Text("return to home page"),
                ),
              ),
            ],
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