class Solution {
  int countGoodIntegers(int n, int k) {
    int res = 0;

    // precalculate the factorials
    final factorial = List.generate(11, (i) => i)
                           .map((i) => permutation(i))
                           .toList();
    
    // the maximum number of the half of n digits
    final lim = pow(10, (n / 2).ceil()).toInt();

    // the count of each digits of palindrome dividable by k
    final visit = <String>{};
    for (int i = 1; i < lim; i++){
      if (i % 10 == 0) continue;
      final palindrome = makePalindrome('$i', n);
      if (palindrome % k == 0) {
        visit.add(digitCnt(palindrome));
      }
    }

    // count the number of cases
    // 1.not leading zero
    // 2.can rearrange to palindrome
    for (final v in visit){
      int cnt = factorial[n];
      final arr = v.split('-').map((d) => int.parse(d)).toList();
      arr.where((d) => d > 0)
         .map((d) => factorial[d])
         .forEach((a) => cnt ~/= a);
      if (arr[0] > 0){
        int leadingZero = factorial[n - 1];
        arr[0]--;
        arr.where((d) => d > 0)
           .map((d) => factorial[d])
           .forEach((a) => leadingZero ~/= a);
        arr[0]++;
        cnt -= leadingZero;
      }
      // print('none zero cnt: $cnt');
      res += cnt;
      // print('v: $v, cnt: $cnt');
    }
    return res;
  }

  int permutation(int n) => List.generate(n, (i) => i + 1).fold(1, (a, b) => a * b);

  String digitCnt(int n){
    final digits = List.filled(10, 0);
    while (n > 0){
      digits[n % 10]++;
      n ~/= 10;
    }
    return digits.map((d) => '$d').join('-');
  }
  
  int makePalindrome(String tail, int n){
    final head = tail.split('').reversed.join('');
    if (head.length + tail.length > n){
      return int.parse(head + tail.substring(1));
    }
    final center = '0' * (n - tail.length - head.length);
    return int.parse('$head$center$tail');
  }
}