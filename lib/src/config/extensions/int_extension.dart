extension IntExtension on int {
  String formatToMinuteAndSecond() {
    return "${(this ~/ 60).toString().padLeft(2, "0")}:${(this % 60).toString().padLeft(2, "0")}";
  }
}
