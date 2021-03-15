//CONTRIBUTION - BRANDON 100% CONOR 0%

List<String> binaryListSearch<T extends Comparable<Object>>(List<String> sortedList, String value) {
  int min = 0;
  int max = sortedList.length;
  List<String> returnList = new List();
  List<String> failList = new List();
  failList.add("No result found");
  while (min < max) {
    final int mid = min + ((max - min) >> 1);
    final String element = sortedList[mid];
    final bool contains = element.contains(value);
    if (contains == true) {
      returnList.add(element);
    }
    if (contains == false) {
      min = mid + 1;
    } else {
      max = mid;
    }
  }
  if (returnList.length == 0) {
    failList.sort();
    return failList;
  }
  returnList.sort();
  return returnList;
}