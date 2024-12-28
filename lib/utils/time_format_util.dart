class TimeFormatUtils {
  /// Fungsi untuk memastikan waktu dalam format `HH:MM`
  /// Jika `addTwoHours` bernilai true, waktu akan ditambah 2 jam
  static String formatTime(String inputTime, {bool addTwoHours = false}) {
    try {
      // Pisahkan jam dan menit berdasarkan karakter ":" atau spasi
      List<String> parts = inputTime.split(RegExp(r'[:\s]+'));

      // Pastikan bagian jam dan menit tersedia
      if (parts.length != 2) {
        throw const FormatException('Waktu tidak valid. Format harus HH:MM.');
      }

      // Parsing bagian jam dan menit ke integer
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      // Validasi rentang jam (0-23) dan menit (0-59)
      if (hour < 0 || hour > 23) {
        throw const FormatException('Jam harus berada dalam rentang 0-23.');
      }
      if (minute < 0 || minute > 59) {
        throw const FormatException('Menit harus berada dalam rentang 0-59.');
      }

      // Tambahkan 2 jam jika opsi `addTwoHours` bernilai true
      if (addTwoHours) {
        hour += 2;
        if (hour >= 24) {
          hour -= 24; // Pastikan format 24-jam tetap valid
        }
      }

      // Format ulang jam dan menit dengan leading zero jika diperlukan
      String formattedHour = hour.toString().padLeft(2, '0');
      String formattedMinute = minute.toString().padLeft(2, '0');

      return '$formattedHour:$formattedMinute';
    } catch (e) {
      // Tangkap kesalahan parsing dan validasi
      return 'Error: ${e.toString()}';
    }
  }
}
