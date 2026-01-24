import 'dart:collection';

class Pair {
  final int idx;
  final int sum;

  Pair(this.sum, this.idx);

  @override
  bool operator ==(Object other) =>
      other is Pair && sum == other.sum && idx == other.idx;

  @override
  int get hashCode => Object.hash(sum, idx);
}

class Solution {
  int minimumPairRemoval(List<int> nums) {
    int n = nums.length;
    List<int> temp = List<int>.from(nums);

    // TreeSet equivalent in Dart
    var minPairSet = SplayTreeSet<Pair>((a, b) {
      if (a.sum != b.sum) return a.sum.compareTo(b.sum);
      return a.idx.compareTo(b.idx);
    });

    List<int> nextIndex = List<int>.generate(n, (i) => i + 1);
    List<int> prevIndex = List<int>.generate(n, (i) => i - 1);

    int badPairs = 0;
    for (int i = 0; i < n - 1; i++) {
      if (temp[i] > temp[i + 1]) {
        badPairs++;
      }
      minPairSet.add(Pair(temp[i] + temp[i + 1], i));
    }

    int operations = 0;

    while (badPairs > 0) {
      Pair cur = minPairSet.first;
      minPairSet.remove(cur);

      int first = cur.idx;
      int second = nextIndex[first];

      int firstLeft = prevIndex[first];
      int secondRight = nextIndex[second];

      if (temp[first] > temp[second]) {
        badPairs--;
      }

      // Adjust badPairs with left neighbor
      if (firstLeft >= 0) {
        if (temp[firstLeft] > temp[first] &&
            temp[firstLeft] <= temp[first] + temp[second]) {
          badPairs--;
        } else if (temp[firstLeft] <= temp[first] &&
            temp[firstLeft] > temp[first] + temp[second]) {
          badPairs++;
        }
      }

      // Adjust badPairs with right neighbor
      if (secondRight < n) {
        if (temp[secondRight] >= temp[second] &&
            temp[secondRight] < temp[first] + temp[second]) {
          badPairs++;
        } else if (temp[secondRight] < temp[second] &&
            temp[secondRight] >= temp[first] + temp[second]) {
          badPairs--;
        }
      }

      // Update left neighbor pair
      if (firstLeft >= 0) {
        minPairSet.remove(Pair(temp[firstLeft] + temp[first], firstLeft));
        minPairSet.add(
            Pair(temp[firstLeft] + temp[first] + temp[second], firstLeft));
      }

      // Update right neighbor pair
      if (secondRight < n) {
        minPairSet.remove(Pair(temp[second] + temp[secondRight], second));
        minPairSet.add(
            Pair(temp[first] + temp[second] + temp[secondRight], first));
        prevIndex[secondRight] = first;
      }

      nextIndex[first] = secondRight;
      temp[first] += temp[second];

      operations++;
    }

    return operations;
  }
}