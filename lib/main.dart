import 'package:drink_water_reminder/core/water_amount_button.dart';
import 'package:drink_water_reminder/core/water_intake_service.dart';
import 'package:flutter/material.dart';

// DeepSeek approach that uses Flutter's built-in ValueNotifier and ValueListenableBuilder, avoiding the Provider package altogether. Thus, there's no need for ChangeNotifierProvider or context.read, which were causing errors
void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WaterTrackerScreen(),
    );
  }
}

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  final WaterIntakeService _waterService = WaterIntakeService();

  void _updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Daily Water Intake',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: _waterService.progress,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 30,
            ),
            const SizedBox(height: 20),
            Text(
              '${_waterService.waterConsumed.toStringAsFixed(0)}ml / '
              '${_waterService.dailyGoal.toStringAsFixed(0)}ml',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WaterAmountButton(
                  amount: 250,
                  onPressed: () {
                    _waterService.drinkWater(250);
                    _updateUI();
                  },
                ),
                WaterAmountButton(
                  amount: 500,
                  onPressed: () {
                    _waterService.drinkWater(500);
                    _updateUI();
                  },
                ),
                WaterAmountButton(
                  amount: 750,
                  onPressed: () {
                    _waterService.drinkWater(750);
                    _updateUI();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _waterService.resetIntake();
                _updateUI();
              },
              child: const Text('Reset'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}