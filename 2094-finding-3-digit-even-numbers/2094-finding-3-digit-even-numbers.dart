class Solution {
  List<int> findEvenNumbers(List<int> digits) {
    final res = <int>[];
    final arr = List.filled(10, 0);
    digits.forEach((d) => arr[d]++);
    for (int n1 = 1; n1 < 10; n1++){
      if (arr[n1] == 0) continue;
      arr[n1]--;
      for (int n2 = 0; n2 < 10; n2++){
        if (arr[n2] == 0) continue;
        arr[n2]--;
        for (int n3 = 0; n3 < 10; n3++){
          if (arr[n3] == 0 || n3 % 2 == 1) continue;
          res.add(n1 * 100 + n2 * 10 + n3);
        }
        arr[n2]++;
      }
      arr[n1]++;
    }
    return res;
  }
}