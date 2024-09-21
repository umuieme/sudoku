extension DeepCopyList<T> on List<List<T>> {
  List<List<T>> deepCopy({T Function(T)? copyFunction}) {
    return map((innerList) {
      return innerList
          .map((item) => copyFunction != null ? copyFunction(item) : item)
          .toList();
    }).toList();
  }
}
