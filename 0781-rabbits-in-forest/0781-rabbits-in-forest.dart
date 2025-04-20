class Solution {
  int numRabbits(List<int> answers) {
    int res = 0;
    final arr = List.filled(1001, 0);
    for (final ans in answers){
        arr[ans + 1]++;
    }
    for (int i = 1; i < arr.length; i++){
        res += (arr[i] / i).ceil() * i;
    }
    return res;
  }
}