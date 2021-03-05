List<String> sequentialListSearch(String searchQuery,
    List<String> lowerCaseList, List<String> upperCaseList) {
  //New list for return statement.
  //List 1 is lowercase list, List 2 is normal list.
  List<String> returnList = new List();

  if (searchQuery == null ||
      searchQuery == "" ||
      lowerCaseList == null ||
      lowerCaseList.isEmpty ||
      upperCaseList == null ||
      upperCaseList.isEmpty) {
    returnList.add("No results found!");
    return returnList;
  }

  for (var i = 0; i < lowerCaseList.length; i++) {
    if (lowerCaseList[i].contains(searchQuery)) {
      returnList.add(upperCaseList[i]);
    }
  }
  //Some error handling in case search has no matches.
  if (returnList.isEmpty) {
    returnList.add("No results found!");
    return returnList;
  }
  //Result returned.
  return returnList;
}
