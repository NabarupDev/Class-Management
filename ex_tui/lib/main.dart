import 'package:animations/animations.dart';
import 'package:ex_tui/register.dart';
import 'package:ex_tui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loader = false;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Utils.primaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 25,
                  bottom: 510,
                ),
                padding: const EdgeInsets.only(
                  top: 200,
                  left: 100,
                ),
                alignment: Alignment.topRight,
                transform: Matrix4.rotationZ(-55 * 3.1415927 / 180),
                decoration: const BoxDecoration(
                  color: Utils.secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 125, right: 20),
                transformAlignment: Alignment.centerRight,
                transform: Matrix4.rotationZ(35 * 3.1415927 / 180),
                decoration: const BoxDecoration(
                    color: Utils.secondaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 380,
                  left: 70,
                ),
                transformAlignment: Alignment.bottomLeft,
                transform: Matrix4.rotationZ(35 * 3.1415927 / 180),
                decoration: const BoxDecoration(
                  color: Utils.thirdColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                width: 1000,
                height: MediaQuery.of(context).size.height + 200,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 300,
                    right: 130,
                  ),
                  transformAlignment: Alignment.centerRight,
                  transform: Matrix4.rotationZ(35 * 3.1415927 / 180),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 25,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 80),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 0),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              label: Text(
                                "Email",
                                style: GoogleFonts.poppins(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Utils.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 80),
                          child: TextFormField(
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 0),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              label: Text(
                                "Password",
                                style: GoogleFonts.poppins(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Utils.primaryColor,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                child: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Utils.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 80),
                          child: InkWell(
                            onTap: () {},
                            child: const SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Forgot Password?"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              loader = !loader;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Utils.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: loader
                                  ? LoadingAnimationWidget.threeRotatingDots(
                                      color: Utils.primaryColor,
                                      size: 30,
                                    )
                                  : const SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Login",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Utils.primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OpenContainer(
                                transitionType: ContainerTransitionType.fade,
                                closedColor: Colors.transparent,
                                closedElevation: 0,
                                transitionDuration: Duration(milliseconds: 500),
                                closedBuilder: (context, action) {
                                  return Text(
                                    "Don't have an account? Sign up",
                                    style: GoogleFonts.poppins(
                                      color: Utils.primaryColor,
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                                openBuilder: (context, action) =>
                                    const Register(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
