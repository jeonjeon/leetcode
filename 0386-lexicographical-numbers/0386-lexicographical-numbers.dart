class Solution {
  List<int> lexicalOrder(int n) {
    // Generate the list of numbers from 1 to n
  List<int> numbers = [for (int i = 1; i <= n; i++) i];

  // Sort the numbers lexicographically by converting them to strings
  numbers.sort((a, b) => a.toString().compareTo(b.toString()));
  return numbers;
  }
}