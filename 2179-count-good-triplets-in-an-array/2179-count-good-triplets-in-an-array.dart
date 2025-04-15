class Solution {
  int goodTriplets(List<int> nums1, List<int> nums2) {
     final result = allCommonSubsequences(nums1, nums2);
     return extractTriplets(result).length;
  }

  List<List<int>> allCommonSubsequences(List<int> nums1, List<int> nums2) {
    final memo = <String, Set<List<int>>>{};

    Set<List<int>> dp(int i, int j) {
      final key = '$i|$j';
      if (memo.containsKey(key)) return memo[key]!;

      final result = <List<int>>{};

      if (i >= nums1.length || j >= nums2.length) {
        result.add([]);
      } else {
        if (nums1[i] == nums2[j]) {
          for (var subseq in dp(i + 1, j + 1)) {
            result.add([nums1[i], ...subseq]);
          }
        }

        for (var subseq in dp(i + 1, j)) {
          result.add(subseq);
        }

        for (var subseq in dp(i, j + 1)) {
          result.add(subseq);
        }
      }

      memo[key] = result;
      return result;
    }

    final allSubsequences = dp(0, 0);

    // Keep only non-empty and length > 2 subsequences
    allSubsequences.removeWhere((seq) => seq.length <= 2);

    return allSubsequences.toList();
  }

  Set<List<int>> extractTriplets(List<List<int>> subsequences) {
    final triplets = <String>{}; // Use String representation to avoid duplicates

    for (var subseq in subsequences) {
      final n = subseq.length;
      for (int i = 0; i < n - 2; i++) {
        for (int j = i + 1; j < n - 1; j++) {
          for (int k = j + 1; k < n; k++) {
            final triplet = [subseq[i], subseq[j], subseq[k]];
            triplets.add(triplet.join(','));
          }
        }
      }
    }

    return triplets.map((t) => t.split(',').map(int.parse).toList()).toSet();
  }
}