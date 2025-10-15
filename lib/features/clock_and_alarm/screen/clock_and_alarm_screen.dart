import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/clock_and_alarm_screen_controller.dart';
import '../widget/analog_clock.dart';

class ClockAndAlarmScreen extends StatelessWidget {
  const ClockAndAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(ClockAndAlarmScreenController());

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clock & Alarm'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Clock'),
              Tab(text: 'Alarm'),
              Tab(text: 'Timer'),
              Tab(text: 'Stopwatch'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Clock view with analog clock
            Obx(() {
              final now = ctl.currentTime.value;
              final timeStr = TimeOfDay.fromDateTime(now).format(context);
              final dateStr = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnalogClock(datetime: now, size: 220.w),
                    SizedBox(height: 12.h),
                    Text(timeStr, style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.h),
                    Text(dateStr, style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
              );
            }),

            // Alarm view
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  Expanded(
                    child: Obx(() => ListView.builder(
                          itemCount: ctl.alarms.length,
                          itemBuilder: (context, index) {
                            final alarm = ctl.alarms[index];
                            final label = alarm.label.isNotEmpty ? alarm.label : alarm.time.format(context);
                            return ListTile(
                              title: Text(label),
                              subtitle: Text(alarm.time.format(context)),
                              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                                Switch(value: alarm.enabled, onChanged: (_) => ctl.toggleAlarmEnabled(index)),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () => ctl.removeAlarm(index),
                                )
                              ]),
                            );
                          },
                        )),
                  ),
                  SizedBox(height: 12.h),
                  ElevatedButton.icon(
                    icon: Icon(Icons.add_alarm),
                    label: Text('Add Alarm'),
                    onPressed: () async {
                      final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                      if (t != null) {
                        ctl.addAlarm(AlarmItem(time: t));
                      }
                    },
                  ),
                ],
              ),
            ),

            // Timer view
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  Obx(() {
                    final remaining = ctl.timerRemaining.value;
                    final text = '${remaining.inHours.toString().padLeft(2,'0')}:${(remaining.inMinutes%60).toString().padLeft(2,'0')}:${(remaining.inSeconds%60).toString().padLeft(2,'0')}';
                    return Column(
                      children: [
                        Text(text, style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold)),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: ctl.isTimerRunning.value ? ctl.stopTimer : () async {
                                // let user pick minutes/seconds
                                final minutes = await _askForNumber(context, 'Minutes', 0);
                                final seconds = await _askForNumber(context, 'Seconds', 30);
                                if (minutes != null && seconds != null) {
                                  ctl.startTimer(Duration(minutes: minutes, seconds: seconds));
                                }
                              },
                              child: Obx(() => Text(ctl.isTimerRunning.value ? 'Stop' : 'Start')),
                            ),
                            SizedBox(width: 12.w),
                            ElevatedButton(onPressed: ctl.resetTimer, child: Text('Reset')),
                          ],
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),

            // Stopwatch view
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  Obx(() {
                    final elapsed = ctl.stopwatchElapsed.value;
                    final text = '${elapsed.inHours.toString().padLeft(2,'0')}:${(elapsed.inMinutes%60).toString().padLeft(2,'0')}:${(elapsed.inSeconds%60).toString().padLeft(2,'0')}';
                    return Column(
                      children: [
                        Text(text, style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold)),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: ctl.isStopwatchRunning.value ? ctl.stopStopwatch : ctl.startStopwatch,
                                child: Obx(() => Text(ctl.isStopwatchRunning.value ? 'Stop' : 'Start'))),
                            SizedBox(width: 12.w),
                            ElevatedButton(onPressed: ctl.resetStopwatch, child: Text('Reset')),
                          ],
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // helper to ask for numeric input
  static Future<int?> _askForNumber(BuildContext context, String label, int initial) async {
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
          TextButton(onPressed: () => Navigator.pop(context, null), child: Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, int.tryParse(controller.text) ?? initial), child: Text('OK')),
        ],
      ),
    );
    return result;
  }
}