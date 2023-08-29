import 'package:flutter/material.dart';
import 'package:graduation_project/screens/signupscreen.dart';
import 'package:graduation_project/styles/app_colors.dart';
import 'package:graduation_project/styles/text_styles.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "تعديل البيانات",
            style: KTextStyle.headerTextStyle,
          ),
        ),
        backgroundColor: AppColors.yellow,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.whiteshade,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: AppColors.yellow),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: AppColors.emptyImage,
                          )
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/822721_user_512x512.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: AppColors.whiteshade,
                          ),
                          color: AppColors.yellow,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.whiteshade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(
                        maxWidth: 400), // Adjust the maximum width as needed
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "عميل", // Replace with the appropriate profile type
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("الاسم ثلاثي", userName, false,
                  maxLength: 25, minLength: 3),
              buildTextField("رقم المحمول", phoneNumber, false,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  minLength: 11),
              buildTextField("الرقم السري", password, true,
                  maxLength: 20, minLength: 8),
              buildTextField("العنوان", address, false,
                  maxLength: 65, minLength: 4),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "الغاء",
                      style: KTextStyle.cancelButtonTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "حفظ",
                      style: KTextStyle.authButtonTextStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final Map<String, bool> _fieldErrors = {};

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField,
      {TextInputType? keyboardType, int? maxLength, int? minLength}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              obscureText: isPasswordTextField ? _obscurePassword : false,
              keyboardType: keyboardType,
              maxLength: maxLength,
              onChanged: (value) {
                setState(() {
                  if (minLength != null && value.length < minLength) {
                    _fieldErrors[labelText] = true;
                  } else {
                    _fieldErrors[labelText] = false;
                  }
                });
              },
              decoration: InputDecoration(
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.hintText,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      )
                    : null,
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: labelText,
                labelStyle: KTextStyle.textFieldHeading,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.hintText,
                ),
              ),
            ),
          ),
          if (_fieldErrors[labelText] ?? false)
            const Text(
              "Error, too short value.",
              style: TextStyle(color: AppColors.warning),
            ),
        ],
      ),
    );
  }
}
