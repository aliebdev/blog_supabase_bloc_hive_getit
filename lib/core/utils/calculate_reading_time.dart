int calculateReadingTime(String content) {
  final wordCount = content.split(RegExp(r'\s+')).length;
  // speed = distance/time
  // 225 = human average reading words count per minute
  final readingTime = wordCount / 225;
  return readingTime.ceil();
}
