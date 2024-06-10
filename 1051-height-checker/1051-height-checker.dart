class Solution {
  int heightChecker(List<int> h) {
    int res = 0;
    final org = h.toList();
    h.sort();
    for(int i = 0; i < h.length; i++){
      if(h[i] != org[i]){
        res++;
      }
    }
    return res;
  }
}