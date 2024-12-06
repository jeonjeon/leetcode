class Solution {
  int maxCount(List<int> banned, int n, int maxSum) {
    Set<int> setOfBanned = banned.toSet();
    int maxNum = 0;
    int sum = 0;
    for(int i = 1;i<=n;i++){
        if(setOfBanned.contains(i)) continue;
        if(sum + i> maxSum) break;
        sum+=i;
        maxNum++;
    }
    return maxNum;
  }
}