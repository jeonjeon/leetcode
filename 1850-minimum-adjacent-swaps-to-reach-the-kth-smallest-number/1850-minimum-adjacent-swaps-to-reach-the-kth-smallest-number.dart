class Solution {
  int getMinSwaps(String n, int k) {
    final arr = n.split('').map((a) => int.parse(a)).toList();
    final kth = getKthSmall(List<int>.from(arr), k);
    return swap(arr, kth);
  }
  int swap(List<int> arr, List<int> arr1){
    int res = 0;
    for (int i = 0; i < arr.length; i++){
      int j = i;
      while (arr[i] != arr1[j]) j++;
      while (i < j){
        final temp = arr1[j];
        arr1[j] = arr1[j - 1];
        arr1[j - 1] = temp;
        j--;
        res++;
      }
    }
    return res;
  }
  
  List<int> getKthSmall(List<int> kth, int k){
    for (int i = 0; i < k; i++){
      int l = kth.length - 2;
      int r = kth.length - 1;
      while (kth[l] >= kth[l + 1]){
        l--;  
      }
      while (kth[r] <= kth[l]){
        r--;
      }
      final temp = kth[r];
      kth[r] = kth[l];
      kth[l] = temp;
      final head = kth.sublist(0, l + 1);
      final tail = kth.sublist(l + 1)..sort();
      kth = head + tail;
    }
    return kth;
  }
}