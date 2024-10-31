import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/core/widgets/custom_button.dart';
import 'package:novindus_task/core/widgets/custom_field.dart';
import 'package:novindus_task/features/home/view/pages/widgets/patient_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
          vertical: h * .03,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomField(
                      prefIcon: const Icon(Icons.search),
                      isSearchField: true,
                      hintText: 'Search for treatments',
                      controller: searchController),
                ),
                SizedBox(
                  width: w * .04,
                ),
                CustomButton(
                  containerHeight: h * .05,
                  buttonText: 'Search',
                  textSize: w * .03,
                )
              ],
            ),
            SizedBox(
              height: h * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort by :',
                  style: getTextStylePoppins(
                    width: w * .04,
                  ),
                ),
                Text(
                  'Sort by :',
                  style: getTextStylePoppins(
                    width: w * .04,
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * .03,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PatientCard();
              },
            )),
            SizedBox(
              height: h * .02,
            ),
            CustomButton(
                buttonText: 'Register Now',
                textSize: w * .05,
                containerHeight: h * .07),
            SizedBox(
              height: h * .02,
            ),
          ],
        ),
      ),
    );
  }
}
