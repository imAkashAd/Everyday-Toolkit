import 'package:animated_analog_clock/animated_analog_clock.dart';
import 'package:api_test/core/common/widgets/text_property.dart';
import 'package:api_test/features/clock_and_alarm/controller/clock_and_alarm_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(ClockAndAlarmScreenController());
    
    return Obx(() {
              final now = ctl.currentTime.value;
              final timeStr = TimeOfDay.fromDateTime(now).format(context);
              final dateStr =
                  '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
              return Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 100.h,),
                    AnimatedAnalogClock(
                      dialType: DialType.numberAndDashes,
                      // Gradient Background if you want
                      // backgroundGradient: RadialGradient(colors: []),
                      // Set a network image as the background
                      // backgroundImage: NetworkImage(
                      // 'url',
                      // ),
                      // Alternatively, set an asset image as the background
                      // backgroundImage: AssetImage(
                      //   'path/to/your/asset/image.png',
                      // ),
                      numberColor: Color.fromARGB(255, 26, 109, 11),
                      clock: () => DateTime.now(),
                      backgroundColor: Color(0xFF9DD493),
                      hourHandColor: Colors.blue,
                      minuteHandColor: Colors.blue,
                      secondHandColor: Colors.deepPurpleAccent,
                      centerDotColor: Colors.white,
                      hourDashColor: Color.fromARGB(255, 32, 136, 14),
                      minuteDashColor: Colors.blue,
                    ),

                    SizedBox(height: 50.h),
                    TextProperty(
                      text: timeStr,
                      textColor: Color.fromARGB(255, 26, 109, 11),
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      lineHeight: 24,
                    ),
                    SizedBox(height: 20.h),
                    TextProperty(
                      text: dateStr,
                      textColor: Color.fromARGB(255, 26, 109, 11),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      lineHeight: 24,
                    ),
                  ],
                ),
              );
            });
  }
}