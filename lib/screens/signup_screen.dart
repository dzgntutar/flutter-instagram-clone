import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passContoller = TextEditingController();
  final TextEditingController _usernameContoller = TextEditingController();
  final TextEditingController _bioContoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailContoller.dispose();
    _passContoller.dispose();
    _usernameContoller.dispose();
    _bioContoller.dispose();
  }

  navigateToLoginScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/id/237/200"),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                hintText: "Enter your user name.",
                textInputType: TextInputType.text,
                textEditingController: _usernameContoller,
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                hintText: "Enter your email.",
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailContoller,
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                hintText: "Enter your password.",
                textInputType: TextInputType.text,
                textEditingController: _passContoller,
                isPassword: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextInputField(
                hintText: "Enter your bio.",
                textInputType: TextInputType.text,
                textEditingController: _bioContoller,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  String response = AuthMethods().signUpUser(
                      email: _emailContoller.text,
                      password: _passContoller.text,
                      userName: _usernameContoller.text,
                      bio: _bioContoller.text);
                },
                child: Container(
                  child: const Text("Sign   up"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Do you have a account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
