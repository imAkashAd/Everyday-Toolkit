import 'package:api_test/core/common/widgets/custom_app_bar.dart';
import 'package:api_test/features/unit_converter/widget/custom_tab_bar_view.dart';
import 'package:api_test/features/unit_converter/widget/custom_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: CustomAppBar(
        backgroundColor: Color(0xFFF6B187),
        title: 'Unit Converter', 
        homePage: false
      ),

      body: Padding(padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h), 
      child: Column(
        children: [
          CustomTabBarWidget(),
          SizedBox(height: 20.h,),
          CustomTabBarView()
        ],
      )
      ),
    );
  }
}