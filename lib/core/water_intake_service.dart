class WaterIntakeService {
  double _waterConsumed = 0.0;
  final double _dailyGoal = 2000.0;

  double get waterConsumed => _waterConsumed;
  double get dailyGoal => _dailyGoal;
  double get progress => _waterConsumed / _dailyGoal;

  void drinkWater(double amount) {
    _waterConsumed += amount;
    if (_waterConsumed > _dailyGoal) _waterConsumed = _dailyGoal;
  }

  void resetIntake() {
    _waterConsumed = 0.0;
  }
}