import 'dart:math';
class Solution {
  int maxArea(List<int> height) {
    int l = 0, r = height.length - 1, res = 0, highest = 0;
    while (l < r){
      res = max(res,min(height[l], height[r]) * (r - l));
      if (height[l] > height[r]) r--;
      else l++;
    }
    return res;
  }
}