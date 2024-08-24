import 'dart:math';

class Solution {
  String nearestPalindromic(String n) {
    final length = n.length;
    final candidates = <String>{};

    if (n == "1") {
      return "0";
    }

    final prefix = n.substring(0, (length + 1) ~/ 2);
    final prefixNumber = int.parse(prefix);

    for (int i = -1; i <= 1; i++) {
      final newPrefix = (prefixNumber + i).toString();
      var candidate = '';
      if (length % 2 == 0) {
        candidate = newPrefix + newPrefix.split('').reversed.join('');
      } else {
        candidate = newPrefix + newPrefix.substring(0, newPrefix.length - 1).split('').reversed.join('');
      }
      candidates.add(candidate);
    }

    candidates.add((pow(10, length - 1) - 1).toStringAsFixed(0));
    candidates.add((pow(10, length) + 1).toStringAsFixed(0));

    candidates.remove(n);

    return candidates.reduce((a, b) {
      int diffA = (int.parse(a) - int.parse(n)).abs();
      int diffB = (int.parse(b) - int.parse(n)).abs();
      if (diffA == diffB) {
        return int.parse(a) < int.parse(b) ? a : b;
      } else {
        return diffA < diffB ? a : b;
      }
    });
  }
}