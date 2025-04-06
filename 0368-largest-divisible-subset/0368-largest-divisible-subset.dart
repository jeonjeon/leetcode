class Solution {
  List<int> largestDivisibleSubset(List<int> nums) {
    int idx = 0;
    final nms = nums.map((n) => (idx++, n)).toList()..sort((a, b) => a.$2.compareTo(b.$2));
    final idxs = <List<int>>[];
    for (int i = 0; i < nms.length; i++){
      final (id, n) = nms[i];
      idxs.add([id]);
      for (int j = i - 1; j >= 0; j--){
        final (pId, pN) = nms[j];
        if (n % pN == 0 && idxs[i].length <= idxs[j].length) {
          idxs[i] = [...idxs[j], id];
        }
      }
    }
    return idxs.reduce((a, b) => a.length > b.length ? a : b)
               .map((l) => nums[l])
               .toList();
  }
}