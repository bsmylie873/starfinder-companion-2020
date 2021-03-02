List<String> sequentialListSearch(String searchQuery, List<String> list, List<String> list2) {
  //New list for return statement.
  //List 1 is lowercase list, List 2 is normal list.
  List<String> returnList = new List();
  for (var i = 0; i < list.length; i++) {
    if (list[i].contains(searchQuery)) {
      returnList.add(list2[i]);
    }
  }
  //Some error handling in case search has no matches.
  if (returnList.isEmpty) {
    returnList.add("No results found!");
  }
  //Result returned.
  return returnList;
}
