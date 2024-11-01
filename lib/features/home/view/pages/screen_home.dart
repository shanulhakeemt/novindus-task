import 'package:flutter/material.dart';
import 'package:novindus_task/core/common/variables/variables.dart';
import 'package:novindus_task/core/theme/app_pallete.dart';
import 'package:novindus_task/core/theme/text_style.dart';
import 'package:novindus_task/core/utils.dart';
import 'package:novindus_task/core/widgets/custom_button.dart';
import 'package:novindus_task/core/widgets/custom_field.dart';
import 'package:novindus_task/core/widgets/loader.dart';
import 'package:novindus_task/features/home/view/pages/widgets/patient_card.dart';
import 'package:novindus_task/features/home/viewmodel/home_viewmodel.dart';
import 'package:novindus_task/features/register-patient/view/pages/screen_register_patient.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController searchController = TextEditingController();

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();

    _controller = ScrollController()
      ..addListener(() {
        final isBottom =
            _controller.offset >= _controller.position.maxScrollExtent &&
                !_controller.position.outOfRange;

        if (isBottom) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              Provider.of<HomeViewModel>(context, listen: false)
                  .getPageinatedPatientList();
            },
          );
        }
      });
  }

  @override
  void dispose() {
    searchController.dispose();
    _controller.dispose(); // Dispose the controller directly here
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
            Expanded(child: Consumer<HomeViewModel>(
                builder: (context, homeViewModel, child) {
              return homeViewModel.isLoading
                  ? const Loader()
                  : ListView.builder(
                      controller: _controller,
                      itemCount: homeViewModel.isBottomLoading
                          ? homeViewModel.patientModels.length + 1
                          : homeViewModel.patientModels.length,
                      itemBuilder: (context, index) {
                        if (homeViewModel.isBottomLoading &&
                            index == homeViewModel.patientModels.length) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: h * .02),
                            child: const Loader(),
                          );
                        }

                        final patientModel = homeViewModel.patientModels[index];
                        return PatientCard(
                          patientModel: patientModel,
                          index: index + 1,
                        );
                      },
                    );
            })),
            SizedBox(
              height: h * .02,
            ),
            CustomButton(
                onTap: () => navigate(
                      context: context,
                      screen: const ScreenRegisterPatient(),
                    ),
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
