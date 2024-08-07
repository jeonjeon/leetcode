class Solution {
    final hund = {
        0: "Zero",
        1: "One",
        2: "Two",
        3: "Three",
        4: "Four",
        5: "Five",
        6: "Six",
        7: "Seven",
        8: "Eight",
        9: "Nine",
        10: "Ten",
        11: "Eleven",
        12: "Twelve",
        13: "Thirteen",
        14: "Fourteen",
        15: "Fifteen",
        16: "Sixteen",
        17: "Seventeen",
        18: "Eighteen",
        19: "Nineteen",
        20: "Twenty",
        30: "Thirty",
        40: "Forty",
        50: "Fifty",
        60: "Sixty",
        70: "Seventy",
        80: "Eighty",
        90: "Ninety",
    }; 
    final arr = [(1000000000, "Billion"), (1000000, "Million"), (1000, "Thousand"), (100, "Hundred")];
  String numberToWords(int n) {
    if (hund.containsKey(n)) return hund[n]!;
    var res = '';
    while (n > 0){
      if (n >= 100){
        for (final (d, s) in arr){
          if (n < d) continue;
          res += ' ${numberToWords(n ~/ d)} $s'; 
          // print(n ~/ d);
          // print(res);
          n %= d;
          break;
        }
      } else {
        if (hund.containsKey(n)){
          res += ' ${hund[n]}';
          break;
        }
        if (n ~/ 10 > 0){
          res += ' ${hund[(n ~/ 10) * 10]}';
        }
        if (n % 10 > 0){
          res += ' ${hund[n % 10]}'; 
        }
        break;
      }
    }
    return res.trim();
  }
}