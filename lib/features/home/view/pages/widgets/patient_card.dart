import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/features/home/models/patient_model.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key, required this.patientModel, required this.index});
  final PatientModel patientModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: h * .03),
      child: Container(
        height: h * .18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Pallete.containerGreyColor),
        child: Padding(
          padding: EdgeInsets.only(left: w * .04, right: w * .04, top: h * .03),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: w * .08,
                      child: Center(
                        child: Text(
                          '$index. ',
                          style: getTextStylePoppins(width: w * .04),
                        ),
                      )),
                  SizedBox(
                    width: w * .6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          patientModel.name,
                          style: getTextStylePoppins(width: w * .04),
                        ),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Couple Combo Package (Rejuven xxxxxxxxx xxxxxxxxxxxxxxxx",
                          style: getTextStylePoppins(
                              width: w * .037,
                              color: Pallete.subtitleText,
                              weight: FontWeightType.three),
                        ),
                        SizedBox(
                          height: h * .005,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "31/01/2024",
                                  style: getTextStylePoppins(
                                      width: w * .03,
                                      color: Pallete.tailTextColor,
                                      weight: FontWeightType.four),
                                ),
                                Icon(
                                  Icons.calculate,
                                  size: w * .03,
                                  color: Pallete.iconRedColor,
                                )
                              ],
                            ),
                            SizedBox(
                              width: w * .03,
                            ),
                            Row(
                              children: [
                                Text(
                                  patientModel.user,
                                  style: getTextStylePoppins(
                                      width: w * .03,
                                      color: Pallete.tailTextColor,
                                      weight: FontWeightType.four),
                                ),
                                Icon(
                                  Icons.calculate,
                                  size: w * .03,
                                  color: Pallete.iconRedColor,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                color: Pallete.greyColor, // Set the color of the line
                thickness: 1.0, // Set the thickness of the line
                // Optional: space after the line ends
              ),
              SizedBox(
                height: h * .0051,
              ),
              Row(
                children: [
                  SizedBox(
                    width: w * .08,
                  ),
                  Text(
                    "View Booking details",
                    style: getTextStylePoppins(
                        width: w * .037,
                        weight: FontWeightType.three,
                        color: Pallete.blackColor),
                  ),
                  const Expanded(child: SizedBox()),
                  const Icon(CupertinoIcons.forward)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
