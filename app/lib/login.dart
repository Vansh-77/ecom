import 'package:flutter/material.dart';
import 'dart:ui';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool changestyle = false;
  bool signup = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: height * 0.18,
            left: 10,
            right: 10,
            height: height * 0.55,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.13),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: height * 0.09,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.withOpacity(1),
                              Colors.blue.withOpacity(0)
                            ]),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: const Row(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Form(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                          left: 20,
                          right: 20,
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          decoration: const InputDecoration(
                            hintText: "Enter Your Username",
                            labelText: "User Name",
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Enter Your Password",
                            labelText: "Password",
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Row(
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "create one",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.06),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            changestyle = true;
                          });
                          await Future.delayed(
                              const Duration(seconds: 1, milliseconds: 5));
                          // ignore: use_build_context_synchronously
                          await Navigator.pushNamed(context, "/homepage");
                          setState(() {
                            changestyle = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.center,
                          height: 50,
                          width: changestyle ? 50 : 120,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: changestyle
                                ? BorderRadius.circular(50)
                                : BorderRadius.circular(12),
                          ),
                          child: changestyle
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ]));
  }
}
