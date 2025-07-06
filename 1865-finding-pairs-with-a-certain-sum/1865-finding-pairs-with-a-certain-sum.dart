class FindSumPairs {
  final List<int> nums1;
  final List<int> nums2;
  final hm = <int, int>{};
  FindSumPairs(this.nums1, this.nums2) {
    nums1..sort();
    nums2.forEach((n) => hm[n] = (hm[n] ?? 0) + 1);
  }
  
  void add(int index, int val) {
    hm[nums2[index]] = hm[nums2[index]]! - 1;
    nums2[index] += val;
    hm[nums2[index]] = (hm[nums2[index]] ?? 0) + 1;
  }
  
  int count(int tot) {
    int res = 0;
    for (final n in nums1){
        if (n >= tot) break;
        final diff = tot - n;
        res += (hm[diff] ?? 0);
    }
    return res;
  }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * FindSumPairs obj = FindSumPairs(nums1, nums2);
 * obj.add(index,val);
 * int param2 = obj.count(tot);
 */