class Solution {
  int furthestDistanceFromOrigin(String moves) {
    int add = 0, pos = 0;
    for (int i = 0; i < moves.length; i++){
      final m = moves[i];
      if (m == 'L') pos--;
      else if (m == 'R') pos++;
      else add++;
    }
    return pos.abs() + add;
  }
}