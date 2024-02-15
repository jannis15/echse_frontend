String formatDuration(int minutes) {
  if (minutes == 0) {
    return '0 Minuten';
  }

  int days = minutes ~/ (24 * 60);
  int hours = (minutes ~/ 60) % 24;
  int remainingMinutes = minutes % 60;

  String formattedDuration = '';

  if (days > 0) {
    formattedDuration += '$days T ';
  }
  if (days <= 1 && hours > 0) {
    formattedDuration += '$hours Std. ';
  }
  if (days == 0 && hours <= 1 && remainingMinutes > 0) {
    formattedDuration += '$remainingMinutes min';
  }

  return formattedDuration.trim();
}
