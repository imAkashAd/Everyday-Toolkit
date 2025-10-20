import 'package:api_test/features/clock_and_alarm/controller/clock_and_alarm_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.find<ClockAndAlarmScreenController>();
    
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: ctl.alarms.length,
                itemBuilder: (context, index) {
                  final alarm = ctl.alarms[index];
                  final label = alarm.label.isNotEmpty
                      ? alarm.label
                      : alarm.time.format(context);
                  return ListTile(
                    title: Text(label),
                    subtitle: Text(alarm.time.format(context)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Switch(
                          activeColor: Color.fromARGB(255, 109, 209, 92),
                          inactiveThumbColor: Colors.orangeAccent,
                          inactiveTrackColor: Colors.orangeAccent.withOpacity(0.5),
                          trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                          value: alarm.enabled,
                          onChanged: (_) => ctl.toggleAlarmEnabled(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => ctl.removeAlarm(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () async {
              final t = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (t != null) {
                ctl.addAlarm(AlarmItem(time: t));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 109, 209, 92),
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.alarm, color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    'Add Alarm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}