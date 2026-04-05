class Solution {
  bool judgeCircle(String moves) {
    int h = 0, v = 0;
    for (int i = 0; i < moves.length; i++){
      switch (moves[i]) {
        case 'R':
          h++;
          break;
        case 'L':
          h--;
          break;
        case 'U':
          v--;
          break;
        case 'D':
          v++;
          break;
        default:
          break;
      }
    }
    return h == 0 && v == 0;
  }
}