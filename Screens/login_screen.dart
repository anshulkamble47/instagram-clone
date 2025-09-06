import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/Screens/signup_screen.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    //dispose is used because controllers need to disposed when they are not in use
    /* These controllers hold memory/resources as long as they exist.
If you don’t call .dispose(), those controllers:
Keep using memory unnecessarily even when the screen is closed.
Can cause memory leaks in the app.
  */
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
/*
Navigator
Navigator is a Flutter class that manages a stack of screens/pages (called routes).
You can think of it like a pile of pages: push a new one to go forward, pop one to go back.

 Navigator.of(context)
This gets the Navigator instance from the current context (i.e., the part of the widget tree you're in).
context is like a reference to where you are in the UI tree.
Navigator.of(context) finds the nearest Navigator widget above your current widget.

.pushReplacement(...)
This tells the Navigator:
👉 "Push a new screen, but also remove the current one from the stack."
So the user can’t go back to the login screen after reaching the home screen

MaterialPageRoute(...)
This defines what new screen/page you want to show.
It takes a builder function that returns the new widget (screen) to display.
MaterialPageRoute gives it a material animation (like a nice slide transition on Android).
*/
    if (res == "Success") {
      Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const ResponsiveLayout(
        webScreenLayout: WebScreenLayout(),
        mobileScreenLayout: MobileScreenLayout(),
      ),
    ),
  );
    } else {
      showSnackBar(res, context);

      // So you show an error message using showSnackBar().
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(
      context
    ).push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                'assets/insta_logo.svg',
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                height: 64,
              ),
              const SizedBox(height: 64),

              //Text Input for email:
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),

              SizedBox(height: 24),
              //Text Input for password:
              TextFieldInput(
                hintText: "Enter the password",
                isPass: true,
                textInputType: TextInputType.visiblePassword,
                textEditingController: _passwordController,
              ),

              SizedBox(height: 24),

              InkWell(
                /*In this code, InkWell is used to make the "Log in" button tap/click responsive 
with a ripple effect (material touch feedback) when the user taps on it. */
                onTap: loginUser,
                child: Container(
                  child: _isLoading
                      ? (const Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        ))
                      : Text("Log in"),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ), //padding means container ke andar ki jagah
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Flexible(child: Container(), flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't you have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: navigateToSignUp,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
