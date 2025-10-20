class Solution {
  int finalValueAfterOperations(List<String> op) {
    int res = 0;
    for (final o in op){
      if (o.contains('++')){
        res++;
      } else {
        res--;
      }
    }
    return res;
  }
}