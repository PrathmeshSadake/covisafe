// Code to remove last 14 characters from a string.
// Used to remove '[+1234 chars]' from news content.
class StringFormatter {
  static String formattedString(str) => str.substring(0, str.length - 14);
}
