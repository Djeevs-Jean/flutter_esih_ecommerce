// import 'package:flutter/material.dart';
// import 'package:your_app/user_auth.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   bool _isLoading = false;
//   String _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     // Initialise les préférences partagées de l'utilisateur
//     UserAuth.initPrefs();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: _isLoading ? null : _login,
//                   child: _isLoading ? CircularProgressIndicator() : Text('Login'),
//                 ),
//                 SizedBox(height: 16.0),
//                 if (_errorMessage != null)
//                   Text(
//                     _errorMessage,
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _login() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     String username = _usernameController.text.trim();
//     String password = _passwordController.text.trim();

//     bool isLoggedIn = await UserAuth.login(username, password);

//     setState(() {
//       _isLoading = false;
//     });

//     if (isLoggedIn) {
//       Navigator.pushReplacementNamed(context, '/home');
//     } else {
//       setState(() {
//         _errorMessage = 'Invalid username or password';
//       });
//     }
//   }

// }
