import 'package:api_test/core/common/widgets/text_property.dart';
import 'package:api_test/core/utils/constants/icon_path.dart';
import 'package:api_test/features/unit_converter/controller/length_view_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LengthViewScreen extends StatelessWidget {
  const LengthViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LengthViewScreenController());

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              TextProperty(
                text: 'From:',
                textColor: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                lineHeight: 24.h,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 250.w,
                        child: TextField(
                          
                          cursorHeight: 40.h,
                          controller: TextEditingController(text: controller.fromValue.value)
                            ..selection = TextSelection.fromPosition(
                              TextPosition(offset: controller.fromValue.value.length),
                            ),
                          onChanged: controller.updateFromValue,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                          ],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                            height: 60.h / 45.sp,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFF6B187)),
                              borderRadius: BorderRadius.circular(16.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Obx(() => GestureDetector(
                        onTap: () => _showUnitPicker(context, controller, true),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFF6B187).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            children: [
                              TextProperty(
                                text: controller.fromUnit.value,
                                textColor: Color.fromARGB(255, 253, 160, 102),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                lineHeight: 12.h,
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 253, 160, 102),
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: controller.swapUnits,
          child: CircleAvatar(
            radius: 30.r,
            backgroundColor: Color(0xFFF6B187),
            child: Image.asset(
              IconPath.convert,
              height: 40.h,
              width: 40.w,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              TextProperty(
                text: 'To:',
                textColor: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                lineHeight: 24.h,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(() => FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: TextProperty(
                            text: controller.toValue.value,
                            textColor: Colors.black,
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                            lineHeight: 40.h,
                          ),
                        )),
                  ),
                  SizedBox(width: 16.w),
                  Obx(() => GestureDetector(
                        onTap: () => _showUnitPicker(context, controller, false),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Color(0xFFF6B187).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Row(
                            children: [
                              TextProperty(
                                text: controller.toUnit.value,
                                textColor: Color.fromARGB(255, 253, 160, 102),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                lineHeight: 12.h,
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color.fromARGB(255, 253, 160, 102),
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showUnitPicker(BuildContext context, LengthViewScreenController controller, bool isFrom) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextProperty(
              text: 'Select Unit',
              textColor: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              lineHeight: 24.h,
            ),
            SizedBox(height: 16.h),
            ...controller.units.map((unit) => ListTile(
                  title: Text(unit),
                  onTap: () {
                    if (isFrom) {
                      controller.updateFromUnit(unit);
                    } else {
                      controller.updateToUnit(unit);
                    }
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}