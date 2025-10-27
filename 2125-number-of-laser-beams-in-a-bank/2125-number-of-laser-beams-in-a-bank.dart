class Solution {
  int numberOfBeams(List<String> bank) {
    final arr = bank.map((b) => b.split('').where((b) => b == '1').length).toList();
    int prev = 0, res = 0;
    for (int i = 0; i < arr.length; i++){
        if (arr[i] == 0) continue;
        if (prev == 0) {
            prev = arr[i];
            continue;
        }
        res += prev * arr[i];
        prev = arr[i];
    }
    return res;
  }
}