class Solution {
    final under20 = { 0: "", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine", 10: "Ten", 11: "Eleven", 12: "Twelve", 13: "Thirteen", 14: "Fourteen", 15: "Fifteen", 16: "Sixteen", 17: "Seventeen", 18: "Eighteen", 19: "Nineteen"}; 
    final over20 = {20: "Twenty", 30: "Thirty", 40: "Forty", 50: "Fifty", 60: "Sixty", 70: "Seventy", 80: "Eighty", 90: "Ninety"};
    final over100 = [(1000000000, "Billion"), (1000000, "Million"), (1000, "Thousand"), (100, "Hundred")];
  String numberToWords(int n) {
    if (n == 0) return 'Zero';
    var res = '';
    while (n > 0){
      if (n >= 100){
        final (d, s) = over100.firstWhere((a) => a.$1 <= n);
        res += ' ${numberToWords(n ~/ d)} $s'; 
        n %= d;
        continue;
      } 
      if (n >= 20){
        res += ' ${over20[(n ~/ 10) * 10]} ${under20[n % 10]}';
      } else {
        res += ' ${under20[n]}';
      }
      break;
    }
    return res.trim();
  }
}