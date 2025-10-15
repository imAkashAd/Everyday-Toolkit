// import 'package:api_test/Home/widget.dart/custom_app_bar.dart';
import 'package:api_test/features/home/widget.dart/feature_container_widgets.dart';
import 'package:api_test/core/common/widgets/custom_app_bar.dart';
import 'package:api_test/core/utils/constants/icon_path.dart';
import 'package:api_test/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                homePage: true,
                title: 'Everyday Toolkit'),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureContainerWidgets(
                          title: 'Calculator',
                          boxColor: Color(0xFF2EB5A7),
                          iconPath: IconPath.calculator, 
                          onTap: () { 
                            // Get.to(CalculatorScreen());
                            Get.toNamed(AppRoute.getCalculatorScreen());
                           },
                        ),
                        SizedBox(width: 16.w),
                        FeatureContainerWidgets(
                          title: 'Unit Converter',
                          boxColor: Color(0xFFF6B187),
                          iconPath: IconPath.convert,
                          onTap: () { 
                            Get.toNamed(AppRoute.getUnitConverterScreen());
                           },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureContainerWidgets(
                          title: 'Clock & Alarm',
                          boxColor: Color(0xFF9DD493),
                          iconPath: IconPath.alarm,
                          onTap: () {  },
                        ),
                        SizedBox(width: 16.w),
                        FeatureContainerWidgets(
                          title: 'Notes & List',
                          boxColor: Color(0xFFA596CD),
                          iconPath: IconPath.notepad,
                          onTap: () {  },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureContainerWidgets(
                          title: 'Torch',
                          boxColor: Color(0xFF84CCE4),
                          iconPath: IconPath.torch,
                          onTap: () {  },
                        ),
                        SizedBox(width: 16.w),
                        FeatureContainerWidgets(
                          title: 'Compass',
                          boxColor: Color(0xFFECDAAA),
                          iconPath: IconPath.compass,
                          onTap: () {  },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureContainerWidgets(
                          title: 'Water',
                          boxColor: Color(0xFFB9438D),
                          iconPath: IconPath.water,
                          onTap: () {  },
                        ),
                        SizedBox(width: 16.w),
                        FeatureContainerWidgets(
                          title: 'Fitness Tracker',
                          boxColor: Color(0xFF43B96F),
                          iconPath: IconPath.fitness,
                          onTap: () {  },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
