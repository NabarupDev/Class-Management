import 'package:animations/animations.dart';
import 'package:ex_tui/main.dart';
import 'package:ex_tui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Register();
  }
}

class _Register extends StatefulWidget {
  const _Register();

  @override
  State<_Register> createState() => _RegisterState();
}

class _RegisterState extends State<_Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loader = false;
  bool passwordVisible = true;
  final TextEditingController _dob = TextEditingController();
  final List sem = ["1st", "2nd", "3rd", "4th", "5th", "6th"];
  String? semester;

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
                        Utils.customInputBox("Name", Icons.person),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
                          child: TextFormField(
                            controller: _dob,
                            readOnly: true,
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
                                "Date of Birth",
                                style: GoogleFonts.poppins(
                                  color: Utils.primaryColor,
                                ),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          firstDate: DateTime(2024),
                                          lastDate: DateTime.now())
                                      .then((value) {
                                    if (value != null) {
                                      _dob.text =
                                          DateTime.parse(value.toString())
                                              .toString()
                                              .split(" ")[0];
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.calendar_month,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Utils.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Utils.customInputBox("Email", Icons.email),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
                          child: DropdownButtonFormField(
                            dropdownColor: Utils.secondaryColor,
                            isExpanded: true,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.school,
                                color: Utils.primaryColor,
                              ),
                            ),
                            hint: Text(
                              "Select Semester",
                              style: GoogleFonts.poppins(
                                color: Utils.primaryColor,
                              ),
                            ),
                            items: sem
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text("$e Sem"),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                semester = value.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
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
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 50,
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
                                            "Register",
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
                          height: 20,
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
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                closedBuilder: (context, action) {
                                  return Text(
                                    "Already have an account? Login",
                                    style: GoogleFonts.poppins(
                                      color: Utils.primaryColor,
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                                openBuilder: (context, action) =>
                                    const LoginPage(),
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
