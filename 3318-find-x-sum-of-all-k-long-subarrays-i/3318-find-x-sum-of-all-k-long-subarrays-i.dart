class Solution {
  List<int> findXSum(List<int> nums, int k, int x) {
    int n = nums.length;
    List<int> answer = [];
    for (int i = 0; i <= n - k; i++) {
        List<int> window = nums.sublist(i, i + k);
        Map<int, int> frequency = {};
        for (int num in window) {
            frequency[num] = (frequency[num] ?? 0) + 1;
        }
        List<MapEntry<int, int>> entries = frequency.entries.toList();
        entries.sort((a, b) {
            if (a.value != b.value) {
                return b.value.compareTo(a.value);
            } else {
                return b.key.compareTo(a.key);
            }
        });
        Set<int> keep = {};
        int take = x < entries.length ? x : entries.length;
        for (int j = 0; j < take; j++) {
            keep.add(entries[j].key);
        }
        int sum = 0;
        for (int num in window) {
            if (keep.contains(num)) {
                sum += num;
            }
        }
        answer.add(sum);
    }
    return answer;
  }
}