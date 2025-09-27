import 'dart:math';
class Solution {
  double largestTriangleArea(List<List<int>> points) {
    double res = 0.0;
    for (int i = 0; i < points.length - 2; i++){
      for (int j = i + 1; j < points.length - 1; j++){
        for (int k = j + 1; k < points.length; k++){
          res = max(res, area(points[i], points[j], points[k]));
        }
      }
    }
    return res;
  }
  double area(List<int> a,List<int> b,List<int> c){
    final [ax, ay] = a; 
    final [bx, by] = b; 
    final [cx, cy] = c;
    return ((ax * (by - cy) + bx * (cy - ay) + cx * (ay - by)) / 2).abs();
  }
}