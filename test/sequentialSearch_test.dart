import '../lib/utilities/sequentialListSearch.dart';
import 'package:collection/collection.dart';
import 'package:test/test.dart';

void main() {
  Function eq = const ListEquality().equals;
  group('Expected Behaviour Tests', () {
    bool listsMatch = false;
    String searchQuery;
    List<String> upperCaseList = List();
    upperCaseList.add("Cat");
    upperCaseList.add("Dog");
    upperCaseList.add("Rat");
    List<String> completeQueryList = List();
    completeQueryList.add("Cat");
    List<String> nullList = List();
    List<String> lowerCaseList = List();
    lowerCaseList.add("cat");
    lowerCaseList.add("dog");
    lowerCaseList.add("rat");
    List<String> correctResultList = List();
    correctResultList.add("Cat");
    correctResultList.add("Rat");
    List<String> wrongCaseList = List();
    wrongCaseList.add("cat");
    wrongCaseList.add("rat");
    List<String> emptyList = List();
    emptyList.add("No results found!");

    test('Lowercase search "a" passed in - Cat and Rat should be returned', () {
      searchQuery = "a";
      List<String> newList =
          sequentialListSearch(searchQuery, lowerCaseList, upperCaseList);
      if (eq(newList, correctResultList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('Complete search "cat" passed in - Cat should be returned', () {
      searchQuery = "cat";
      List<String> newList =
      sequentialListSearch(searchQuery, lowerCaseList, upperCaseList);
      if (eq(newList, completeQueryList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('Uppercase search "A" passed in - none should be returned', () {
      searchQuery = "A";
      List<String> newList =
          sequentialListSearch(searchQuery, lowerCaseList, upperCaseList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('Lists in wrong order passed in - result should be in lowercase', () {
      searchQuery = "a";
      List<String> newList =
          sequentialListSearch(searchQuery, upperCaseList, lowerCaseList);
      if (eq(newList, wrongCaseList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = "z";
      List<String> newList =
          sequentialListSearch(searchQuery, lowerCaseList, upperCaseList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = "";
      List<String> newList =
          sequentialListSearch(searchQuery, lowerCaseList, upperCaseList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = null;
      List<String> newList =
          sequentialListSearch(searchQuery, lowerCaseList, upperCaseList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = "a";
      List<String> newList =
      sequentialListSearch(searchQuery, nullList, upperCaseList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = "a";
      List<String> newList =
      sequentialListSearch(searchQuery, lowerCaseList, nullList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = "a";
      List<String> newList =
      sequentialListSearch(searchQuery, null, upperCaseList);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
    test('None should be returned', () {
      searchQuery = "a";
      List<String> newList =
      sequentialListSearch(searchQuery, lowerCaseList, null);
      if (eq(newList, emptyList)) {
        listsMatch = true;
      }
      expect(listsMatch, true);
    });
  });
}
