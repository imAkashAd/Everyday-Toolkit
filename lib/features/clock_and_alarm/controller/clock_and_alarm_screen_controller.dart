import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmItem {
	TimeOfDay time;
	String label;
	bool enabled;

	AlarmItem({required this.time, this.label = '', this.enabled = true});
}

class ClockAndAlarmScreenController extends GetxController {
	// Current time observable (updates every second)
	final currentTime = DateTime.now().obs;
	Timer? _clockTimer;

	// Alarms
	final alarms = <AlarmItem>[].obs;

	// Timer (countdown)
	final isTimerRunning = false.obs;
	final timerRemaining = Duration.zero.obs;
	Timer? _countdownTimer;

	// Stopwatch
	final isStopwatchRunning = false.obs;
	final stopwatchElapsed = Duration.zero.obs;
	Timer? _stopwatchTimer;

	@override
	void onInit() {
		super.onInit();
		_startClock();
	}

	@override
	void onClose() {
		_clockTimer?.cancel();
		_countdownTimer?.cancel();
		_stopwatchTimer?.cancel();
		super.onClose();
	}

	void _startClock() {
		_clockTimer = Timer.periodic(Duration(seconds: 1), (_) {
			currentTime.value = DateTime.now();
		});
	}

	// Alarm management
	void addAlarm(AlarmItem alarm) {
		alarms.add(alarm);
	}

	void removeAlarm(int index) {
		if (index >= 0 && index < alarms.length) alarms.removeAt(index);
	}

	void toggleAlarmEnabled(int index) {
		if (index >= 0 && index < alarms.length) {
			alarms[index].enabled = !alarms[index].enabled;
			alarms.refresh();
		}
	}

	// Countdown timer
	void startTimer(Duration duration) {
		_countdownTimer?.cancel();
		timerRemaining.value = duration;
		isTimerRunning.value = true;
		_countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
			if (timerRemaining.value.inSeconds <= 1) {
				_countdownTimer?.cancel();
				isTimerRunning.value = false;
				timerRemaining.value = Duration.zero;
			} else {
				timerRemaining.value = Duration(seconds: timerRemaining.value.inSeconds - 1);
			}
		});
	}

	void stopTimer() {
		_countdownTimer?.cancel();
		isTimerRunning.value = false;
	}

	void resetTimer() {
		stopTimer();
		timerRemaining.value = Duration.zero;
	}

	// Stopwatch
	void startStopwatch() {
		if (isStopwatchRunning.value) return;
		isStopwatchRunning.value = true;
		_stopwatchTimer = Timer.periodic(Duration(milliseconds: 100), (_) {
			stopwatchElapsed.value = stopwatchElapsed.value + Duration(milliseconds: 100);
		});
	}

	void stopStopwatch() {
		_stopwatchTimer?.cancel();
		isStopwatchRunning.value = false;
	}

	void resetStopwatch() {
		stopStopwatch();
		stopwatchElapsed.value = Duration.zero;
	}
}