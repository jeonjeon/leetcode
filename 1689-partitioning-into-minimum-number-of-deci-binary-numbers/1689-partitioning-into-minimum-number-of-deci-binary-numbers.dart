import 'dart:math';
class Solution {
  int minPartitions(String n) {
    return n.split('').map(int.parse).reduce(max);
  }
}