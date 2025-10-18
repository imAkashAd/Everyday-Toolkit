import 'package:api_test/features/clock_and_alarm/controller/clock_and_alarm_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TimerView extends StatelessWidget {
  TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(ClockAndAlarmScreenController());
    
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Obx(() {
            final remaining = ctl.timerRemaining.value;
            final text =
                '${remaining.inHours.toString().padLeft(2, '0')}:${(remaining.inMinutes % 60).toString().padLeft(2, '0')}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}';
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
                      onPressed: ctl.isTimerRunning.value
                          ? ctl.stopTimer
                          : () async {
                              // let user pick minutes/seconds
                              final minutes = await _askForNumber(
                                context,
                                'Minutes',
                                0,
                              );
                              final seconds = await _askForNumber(
                                // ignore: use_build_context_synchronously
                                context,
                                'Seconds',
                                30,
                              );
                              if (minutes != null && seconds != null) {
                                ctl.startTimer(
                                  Duration(minutes: minutes, seconds: seconds),
                                );
                              }
                            },
                      child: Obx(
                        () => Text(ctl.isTimerRunning.value ? 'Stop' : 'Start'),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    ElevatedButton(
                      onPressed: ctl.resetTimer,
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

  static Future<int?> _askForNumber(
    BuildContext context,
    String label,
    int initial,
  ) async {
    final controller = TextEditingController(text: initial.toString());
    final result = await showDialog<int?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(label),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: 'Enter $label'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              int.tryParse(controller.text) ?? initial,
            ),
            child: Text('OK'),
          ),
        ],
      ),
    );
    return result;
  }
}
