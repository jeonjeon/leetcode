class Solution {
  List<int> constructTransformedArray(List<int> n) 
    => List.generate(n.length, (i) => n[(i + n[i] + n.length) % n.length]);
}