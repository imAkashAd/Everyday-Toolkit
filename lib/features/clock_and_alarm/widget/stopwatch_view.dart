import 'package:api_test/features/clock_and_alarm/controller/clock_and_alarm_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StopwatchView extends StatelessWidget {
  StopwatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(ClockAndAlarmScreenController());
    
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Obx(() {
            final elapsed = ctl.stopwatchElapsed.value;
            final text =
                '${elapsed.inHours.toString().padLeft(2, '0')}:${(elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}';
            return Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: ctl.isStopwatchRunning.value
                          ? ctl.stopStopwatch
                          : ctl.startStopwatch,
                      child: Obx(
                        () => Text(
                          ctl.isStopwatchRunning.value ? 'Stop' : 'Start',
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    ElevatedButton(
                      onPressed: ctl.resetStopwatch,
                      child: Text('Reset'),
                    ),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
