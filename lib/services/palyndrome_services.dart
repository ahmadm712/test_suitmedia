class PalydromeServices {
  static bool palyndromeTest({required String text}) {
    String reverseText = text.split('').reversed.join('');
    if (reverseText == text) {
      return true;
    } else {
      return false;
    }
  }
}
