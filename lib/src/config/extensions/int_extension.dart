extension IntExtension on int {
  String get formatToMinuteAndSecond {
    return "${(this ~/ 60).toString().padLeft(2, "0")}:${(this % 60).toString().padLeft(2, "0")}";
  }
}
