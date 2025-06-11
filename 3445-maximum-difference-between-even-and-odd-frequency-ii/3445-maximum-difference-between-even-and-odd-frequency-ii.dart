class Solution {
  int maxDifference(String s, int k) {
    final length = s.length;
    int result = -0x7FFFFFFF; // Equivalent to Int.MIN_VALUE

    for (int first = 0; first < 5; first++) {
      for (int second = 0; second < 5; second++) {
        if (first == second) continue;

        List<int> diff = List.filled(length + 1, 0);
        List<int> parityA = List.filled(length + 1, 0);
        List<int> parityB = List.filled(length + 1, 0);
        List<int> countB = List.filled(length + 1, 0);
        List<int> chars = s.codeUnits;

        for (int i = 1; i <= length; i++) {
          int digit = chars[i - 1] - 48;
          diff[i] = diff[i - 1] +
              (digit == first ? 1 : 0) -
              (digit == second ? 1 : 0);
          parityA[i] = (parityA[i - 1] + (digit == first ? 1 : 0)) & 1;
          parityB[i] = (parityB[i - 1] + (digit == second ? 1 : 0)) & 1;
          countB[i] = countB[i - 1] + (digit == second ? 1 : 0);
        }

        List<List<MinBIT>> storage = List.generate(
          2,
          (_) => List.generate(2, (_) => MinBIT(length + 1)),
        );

        for (int j = 0; j <= length; j++) {
          if (j >= k) {
            int back = j - k;
            int pA = parityA[back];
            int pB = parityB[back];
            int bCount = countB[back];
            storage[pA][pB].insert(bCount, diff[back]);
          }

          if (j > 0 && countB[j] > 0) {
            int altA = 1 - parityA[j];
            int curB = parityB[j];
            int minPrev = storage[altA][curB].getMin(countB[j] - 1);

            if (minPrev != MinBIT.maxValue) {
              result = result > diff[j] - minPrev
                  ? result
                  : diff[j] - minPrev;
            }
          }
        }
      }
    }

    return result == -0x7FFFFFFF ? 0 : result;
  }
}

class MinBIT {
  static const int maxValue = 0x7FFFFFFF;
  late int n;
  late List<int> data;

  MinBIT(int length) {
    n = length;
    data = List.filled(length + 2, maxValue);
  }

  void insert(int index, int value) {
    int i = index + 1;
    while (i <= n) {
      data[i] = data[i] < value ? data[i] : value;
      i += i & -i;
    }
  }

  int getMin(int index) {
    int res = maxValue;
    int i = index + 1;
    while (i > 0) {
      res = res < data[i] ? res : data[i];
      i -= i & -i;
    }
    return res;
  }
}