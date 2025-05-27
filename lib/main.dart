import 'package:drink_water_reminder/core/water_amount_button.dart';
import 'package:drink_water_reminder/core/water_intake_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WaterIntakeProvider(),
      child: const WaterTrackerApp(),
    ),
  );
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

class WaterTrackerScreen extends StatelessWidget {
  const WaterTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Tracker')),
      body: const _TrackerBody(),
    );
  }
}

class _TrackerBody extends StatelessWidget {
  const _TrackerBody();

  @override
  Widget build(BuildContext context) {
    final waterProvider = context.watch<WaterIntakeProvider>();

    return Padding(
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
            value: waterProvider.progress,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 30,
          ),
          const SizedBox(height: 20),
          Text(
            '${waterProvider.waterConsumed.toStringAsFixed(0)}ml / '
            '${waterProvider.dailyGoal.toStringAsFixed(0)}ml',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40),
          const _WaterButtons(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.read<WaterIntakeProvider>().resetIntake(),
            child: const Text('Reset'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaterButtons extends StatelessWidget {
  const _WaterButtons();

  @override
  Widget build(BuildContext context) {
    final waterProvider = context.read<WaterIntakeProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WaterAmountButton(
          amount: 250,
          onPressed: () => waterProvider.drinkWater(250),
        ),
        WaterAmountButton(
          amount: 500,
          onPressed: () => waterProvider.drinkWater(500),
        ),
        WaterAmountButton(
          amount: 750,
          onPressed: () => waterProvider.drinkWater(750),
        ),
      ],
    );
  }
}