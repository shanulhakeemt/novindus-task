import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/constants/asset_constants.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/core/theme/theme.dart';
import 'package:novindus_task/core/ustils.dart';
import 'package:novindus_task/core/widgets/custom_button.dart';
import 'package:novindus_task/core/widgets/custom_field.dart';
import 'package:novindus_task/features/home/view/pages/screen_home.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * .26,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AssetConstants.headerImg,
                      ))),
              child: Center(
                child: Image.asset(
                  AssetConstants.logoImg,
                  scale: 8,
                ),
              ),
            ),
            SizedBox(
                height: .74 * h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * .076,
                    vertical: h * .029,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login or register to book your appointments",
                          style: getTextStylePoppins(
                              width: w * .06, weight: FontWeightType.six),
                        ),
                        SizedBox(
                          height: h * .029,
                        ),
                        Text(
                          "Email",
                          style: getTextStylePoppins(
                              width: w * .041, weight: FontWeightType.four),
                        ),
                        SizedBox(
                          height: h * .006,
                        ),
                        CustomField(
                            hintText: 'Enter your email',
                            controller: emailController),
                        SizedBox(
                          height: h * .019,
                        ),
                        Text(
                          "Email",
                          style: getTextStylePoppins(
                              width: w * .041, weight: FontWeightType.four),
                        ),
                        SizedBox(
                          height: h * .006,
                        ),
                        CustomField(
                            hintText: 'Enter your email',
                            controller: emailController),
                        SizedBox(
                          height: h * .25,
                          child: Center(
                            child: CustomButton(
                              containerHeight: h * .06,
                              textSize: w * .04,
                              buttonText: 'Login',
                              onTap: () => navigate(
                                  context: context, screen: const ScreenHome()),
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'By creating or logging into an account you are agreeing with our ',
                            style: getTextStylePoppins(
                                weight: FontWeightType.five,
                                width: w * .03,
                                color: Pallete.blackColor),
                            children: [
                              TextSpan(
                                  text: 'Terms and Conditions ',
                                  style: getTextStylePoppins(
                                      weight: FontWeightType.five,
                                      width: w * .03,
                                      color: Pallete.textBlueColor)),
                              TextSpan(
                                  text: 'and ',
                                  style: getTextStylePoppins(
                                      weight: FontWeightType.five,
                                      width: w * .03,
                                      color: Pallete.blackColor)),
                              TextSpan(
                                  text: 'Privacy Policy. ',
                                  style: getTextStylePoppins(
                                      weight: FontWeightType.five,
                                      width: w * .03,
                                      color: Pallete.textBlueColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
