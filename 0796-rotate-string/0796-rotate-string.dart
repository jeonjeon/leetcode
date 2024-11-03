class Solution {
  bool rotateString(String s, String goal) {
    if (s.length != goal.length) return false;
    final l = s.length;
    for (int i = 0; i < l; i++){
        bool can = true;
        for (int j = 0; j < l; j++){
            final g = (j + i) % l;
            if (s[j] != goal[g]){
                can = false;
                break;
            }
        }
        if (can) return true;
    }
    return false;
  }
}