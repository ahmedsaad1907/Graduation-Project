import 'package:flutter/material.dart';
import 'package:graduation_project/screens/signin.dart';
import 'package:graduation_project/styles/app_colors.dart';
import 'package:graduation_project/widgets/custom_button.dart';
import 'package:graduation_project/widgets/custom_formfield.dart';
import 'package:graduation_project/widgets/custom_header.dart';
import 'package:graduation_project/widgets/custom_richtext.dart';

final _userName = TextEditingController();
final _phoneNumberController = TextEditingController();
final _passwordController = TextEditingController();
final _addressController = TextEditingController();

String get userName => _userName.text.trim();
String get phoneNumber => _phoneNumberController.text.trim();
String get password => _passwordController.text.trim();
String get address => _addressController.text.trim();

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  final List<String> categories = ['صنايعي', 'مقاول', 'عميل'];
  String selectedCategory = 'صنايعي';

  SignUpScreen({super.key});

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
              text: 'تسجيل جديد',
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SingInScreen()),
                );
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
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09,
                        ),
                        child: Image.asset("assets/images/moqawel.png"),
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        controller: _userName,
                        headingText: "الاسم",
                        hintText: "برجاء كتابه الاسم ثلاثي ",
                        obsecureText: true,
                        suffixIcon: IconButton(
                          color: AppColors.yellow,
                          icon: const Icon(Icons.account_circle_outlined),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        headingText: "رقم الهاتف  ",
                        hintText: "رقم التليفون",
                        obsecureText: false,
                        suffixIcon: IconButton(
                            color: AppColors.yellow,
                            icon: const Icon(Icons.phone),
                            onPressed: () {}),
                        controller: _phoneNumberController,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        controller: _passwordController,
                        headingText: "كلمة السر",
                        hintText: "ثماني حروف على الأقل",
                        obsecureText: true,
                        suffixIcon: IconButton(
                          color: AppColors.yellow,
                          icon: const Icon(Icons.visibility_off_sharp),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomFormField(
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.text,
                        controller: _addressController,
                        headingText: "العنوان ",
                        hintText: "برجاء كتابه المنطقه او محل السكن",
                        obsecureText: false,
                        suffixIcon: IconButton(
                          color: AppColors.yellow,
                          icon: const Icon(Icons.add_business_outlined),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "  الفئـــــــــــــــــه ",
                              style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 20,
                                // Add your style here
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: AppColors.grayshade,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: selectedCategory,
                                onChanged: (newValue) {
                                  selectedCategory = newValue!;
                                },
                                items: categories.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          AuthButton(
                            onTap: () {},
                            text: 'تسجيل',
                          ),
                          const SizedBox(height: 70),
                          CustomRichText(
                            discription: 'لديك حساب بالفعل ؟',
                            text: 'تسجيل الدخول',
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SingInScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                      // const SizedBox(height: 50),
                      //
                      // AuthButton(
                      //   onTap: () {},
                      //   text: 'تسجيل',
                      // ),
                      // CustomRichText(
                      //   discription: 'لديك حساب بالفعل ؟',
                      //   text: 'تسجيل الدخول',
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
