import 'package:flutter/material.dart';
import 'package:graduation_project/screens/signupscreen.dart';
import 'package:graduation_project/styles/app_colors.dart';
import 'package:graduation_project/widgets/custom_button.dart';
import 'package:graduation_project/widgets/custom_formfield.dart';
import 'package:graduation_project/widgets/custom_header.dart';
import 'package:graduation_project/widgets/custom_richtext.dart';
//import 'package:graduation_project/screens/edit_profile.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

String get email => _emailController.text.trim();
String get password => _passwordController.text.trim();

class SingInScreen extends StatelessWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.yellow,
          ),
          CustomHeader(
            text: 'تسجيل الدخول',
            onTap: () {
              /*Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignUp()));*/
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset("assets/images/moqawel.png"),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomFormField(
                      headingText: "رقم الهاتف  ",
                      hintText: "رقم التليفون",
                      obsecureText: false,
                      suffixIcon: IconButton(
                          color: AppColors.yellow,
                          icon: const Icon(Icons.phone),
                          onPressed: () {}),
                      controller: _emailController,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      headingText: "كلمه السر  ",
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      hintText: " ",
                      obsecureText: true,
                      suffixIcon: IconButton(
                          color: AppColors.yellow,
                          icon: const Icon(Icons.visibility_off),
                          onPressed: () {}),
                      controller: _passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "هل نسيت كلمه السر ؟",
                              style: TextStyle(
                                  color: AppColors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AuthButton(
                      onTap: () {},
                      text: 'تسجيل الدخول',
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomRichText(
                          discription: "لا امتلك حساب؟",
                          text: "  تسجيل جديد",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                        ),
                      ],
                    ),

                    // Start

                    // AuthButton(
                    //   onTap: () {
                    //     Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 const EditProfileScreen()));
                    //   },
                    //   text: 'Test',
                    // )

                    // End
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
