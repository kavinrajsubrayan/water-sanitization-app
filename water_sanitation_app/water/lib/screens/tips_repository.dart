// tips_repository.dart

class TipsRepository {
  // A static list containing water conservation tips
  static final List<String> waterConservationTips = [
    "Fix any leaks in your home to save gallons of water.",
    "Turn off the tap while brushing your teeth.",
    "Take shorter showers to conserve water.",
    "Use a broom instead of a hose to clean driveways.",
    "Only run your dishwasher when it's full.",
    "Collect rainwater for watering plants.",
    "Check your toilet for leaks.",
    "Water your garden in the early morning or evening to reduce evaporation.",
    "Install low-flow showerheads and faucets.",
    "Consider native plants that require less water for landscaping."
  ];

  // Method to get a water conservation tip based on the current day of the month
  static String getTodayTip() {
    int dayOfMonth = DateTime.now().day; // Get the current day of the month
    // Return a tip based on the day, ensuring it wraps around if the day exceeds the list length
    return waterConservationTips[dayOfMonth % waterConservationTips.length];
  }
}
