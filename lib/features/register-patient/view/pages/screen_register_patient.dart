import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/core/utils.dart';
import 'package:novindus_task/core/widgets/custom_button.dart';
import 'package:novindus_task/features/register-patient/view/widgets/text_form_field_with_label.dart';

class ScreenRegisterPatient extends StatefulWidget {
  const ScreenRegisterPatient({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenRegisterPatientState createState() => _ScreenRegisterPatientState();
}

class _ScreenRegisterPatientState extends State<ScreenRegisterPatient> {
  final List<TextEditingController> controllers =
      List.generate(8, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: w * .054),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notification_add)),
          )
        ],
        backgroundColor: Pallete.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * .054,
          vertical: h * .01,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text(
                    'Register',
                    style: getTextStylePoppins(
                        width: w * .06, weight: FontWeightType.six),
                  ),
                  SizedBox(
                    height: h * .003,
                  ),
                  const Divider(
                    color: Pallete.greyColor,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: h * .015,
                  ),
                ] +
                List.generate(
                  8,
                  (index) => TextFormFieldWithLabel(
                    hint: textFormFieldDatas[index]['hint'] ?? '',
                    label: textFormFieldDatas[index]['label'] ?? '',
                    controller: controllers[index],
                    isNumber: textFormFieldDatas[index]['isNumber'],
                  ),
                ) +
                [
                  SizedBox(
                    height: h * .02,
                  ),
                  CustomButton(
                      onTap: () => navigate(
                            context: context,
                            screen: const ScreenRegisterPatient(),
                          ),
                      buttonText: 'Save',
                      textSize: w * .05,
                      containerHeight: h * .07),
                  SizedBox(
                    height: h * .02,
                  ),
                ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> textFormFieldDatas = [
    {
      'label': 'Name',
      'hint': 'Enter your Full Name',
      'isNumber': false,
    },
    {
      'label': 'Whatsapp Number',
      'hint': 'Enter your Whatsapp number',
      'isNumber': false,
    },
    {
      'label': 'Address',
      'hint': 'Enter your full address',
      'isNumber': false,
    },
    {
      'label': 'Location',
      'hint': 'Choose your location',
      'isNumber': false,
    },
    {
      'label': 'Branch',
      'hint': 'Select the branch',
      'isNumber': false,
    },
    {
      'label': 'Total Amount',
      'hint': '',
      'isNumber': true,
    },
    {
      'label': 'Discount Amount',
      'hint': '',
      'isNumber': true,
    },
    {
      'label': 'Advance Amount',
      'hint': '',
      'isNumber': true,
    },
    {
      'label': 'Balance Amount',
      'hint': '',
      'isNumber': true,
    },
  ];

  @override
  void dispose() {
    for (TextEditingController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
