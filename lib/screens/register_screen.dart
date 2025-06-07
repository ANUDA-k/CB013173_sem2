// import 'package:flutter/material.dart';
// import 'package:mad_assignment/screens/login.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RegisterPage(),
//     );
//   }
// }

// class RegisterPage extends StatelessWidget {
//   RegisterPage({super.key});

//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.green.shade700, 
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 80),
//               const Text(
//                 "Register",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const Text(
//                 "Create your new account",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.white70,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Form Container
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     // Register Now Heading
//                     const Text(
//                       "Register Now",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 10),

//                     buildTextField("First Name", firstNameController),
//                     buildTextField("Last Name", lastNameController),
//                     buildTextField("Email", emailController),
//                     buildTextField("Password", passwordController, isPassword: true),
//                     buildTextField("Confirm Password", confirmPasswordController, isPassword: true),

//                     const SizedBox(height: 10),
//                     const Text(
//                       "By signing you agree to our Terms of use and privacy policy.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                     const SizedBox(height: 20),

//                     // Sign Up Button
//                     ElevatedButton(
//                       onPressed: () {
//                          Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) =>  LoginPage()),
//                         );
//                         // Handle Sign Up Logic
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         foregroundColor: Colors.white,
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
                      
//                       child: const Text("Sign Up", style: TextStyle(fontSize: 16)),
//                     ),

//                     const SizedBox(height: 15),

//                     // Already have an account? Login
//                     GestureDetector(
//                       onTap: () {

//                       },
//                       child: Text(
//                         "Already have an account? Login",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.green.shade700,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Custom TextField Widget
//   Widget buildTextField(String hintText, TextEditingController controller, {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black54),
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth_provider.dart';
// import 'login.dart';
// import 'home.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   bool _isLoading = false;
//   String? _errorMessage;

//   void _handleRegister() async {
//     final fullName = "${firstNameController.text.trim()} ${lastNameController.text.trim()}";
//     final email = emailController.text.trim();
//     final password = passwordController.text;
//     final confirmPassword = confirmPasswordController.text;

//     if (fullName.trim().isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
//       setState(() {
//         _errorMessage = "All fields are required.";
//       });
//       return;
//     }

//     if (password != confirmPassword) {
//       setState(() {
//         _errorMessage = "Passwords do not match";
//       });
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     try {
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       await authProvider.register(fullName, email, password);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Registration successful! Please log in.")),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//       );
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString().replaceAll('Exception:', '').trim();
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.green.shade700,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 80),
//               const Text("Register",
//                   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
//               const Text("Create your new account",
//                   style: TextStyle(fontSize: 16, color: Colors.white70)),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text("Register Now",
//                         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
//                     const SizedBox(height: 10),

//                     if (_errorMessage != null)
//                       Text(_errorMessage!,
//                           style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),

//                     buildTextField("First Name", firstNameController),
//                     buildTextField("Last Name", lastNameController),
//                     buildTextField("Email", emailController),
//                     buildTextField("Password", passwordController, isPassword: true),
//                     buildTextField("Confirm Password", confirmPasswordController, isPassword: true),

//                     const SizedBox(height: 10),
//                     const Text(
//                       "By signing up, you agree to our Terms and Privacy Policy.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                     const SizedBox(height: 20),

//                     ElevatedButton(
//                       onPressed: _isLoading ? null : _handleRegister,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         foregroundColor: Colors.white,
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: _isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text("Sign Up", style: TextStyle(fontSize: 16)),
//                     ),
//                     const SizedBox(height: 15),

//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                             context, MaterialPageRoute(builder: (_) => const LoginPage()));
//                       },
//                       child: Text(
//                         "Already have an account? Login",
//                         style: TextStyle(
//                             fontSize: 14, color: Colors.green.shade700, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String hintText, TextEditingController controller, {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black54),
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth_provider.dart';
// import 'package:mad_assignment/screens/login.dart';
// // import 'package:mad_assignment/screens/home.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   bool _isLoading = false;
//   String? _errorMessage;

//   void _handleRegister() async {
//     final fullName = "${firstNameController.text.trim()} ${lastNameController.text.trim()}";
//     final email = emailController.text.trim();
//     final password = passwordController.text;
//     final confirmPassword = confirmPasswordController.text;

//     if (fullName.trim().isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
//       setState(() {
//         _errorMessage = "All fields are required.";
//       });
//       return;
//     }

//     if (password != confirmPassword) {
//       setState(() {
//         _errorMessage = "Passwords do not match";
//       });
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     try {
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       await authProvider.register(fullName, email, password);

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Registration successful! Please log in.")),
//       );

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const LoginPage()),
//       );
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString().replaceAll('Exception:', '').trim();
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.green.shade700,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 80),
//               Text(
//                 "Register",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               Text(
//                 "Create your new account",
//                 style: TextStyle(fontSize: 16, color: Colors.white70),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//                 margin: const EdgeInsets.only(top: 20),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Register Now",
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
//                     ),
//                     const SizedBox(height: 10),

//                     if (_errorMessage != null)
//                       Text(
//                         _errorMessage!,
//                         style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
//                       ),

//                     buildTextField("First Name", firstNameController),
//                     buildTextField("Last Name", lastNameController),
//                     buildTextField("Email", emailController),
//                     buildTextField("Password", passwordController, isPassword: true),
//                     buildTextField("Confirm Password", confirmPasswordController, isPassword: true),

//                     const SizedBox(height: 10),
//                     Text(
//                       "By signing up, you agree to our Terms and Privacy Policy.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12, color: Colors.black54),
//                     ),
//                     const SizedBox(height: 20),

//                     ElevatedButton(
//                       onPressed: _isLoading ? null : _handleRegister,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         foregroundColor: Colors.white,
//                         minimumSize: const Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: _isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : Text("Sign Up", style: TextStyle(fontSize: 16)),
//                     ),
//                     const SizedBox(height: 15),

//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (_) => const LoginPage()),
//                         );
//                       },
//                       child: Text(
//                         "Already have an account? Login",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.green.shade700,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String hintText, TextEditingController controller, {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black54),
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:mad_assignment/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  void _handleRegister() async {
    final fullName = "${firstNameController.text.trim()} ${lastNameController.text.trim()}";
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (fullName.trim().isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = "All fields are required.";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _errorMessage = "Passwords do not match";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.register(fullName, email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful! Please log in.")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception:', '').trim();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade700,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                "Register",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "Create your new account",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Register Now",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 10),

                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                      ),

                    buildTextField("First Name", firstNameController),
                    buildTextField("Last Name", lastNameController),
                    buildTextField("Email", emailController),
                    buildTextField("Password", passwordController, isPassword: true),
                    buildTextField("Confirm Password", confirmPasswordController, isPassword: true),

                    const SizedBox(height: 10),
                    Text(
                      "By signing up, you agree to our Terms and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: _isLoading ? null : _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text("Sign Up", style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 15),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
