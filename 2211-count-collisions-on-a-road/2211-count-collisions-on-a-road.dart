class Solution {
  int countCollisions(String dir) {
    int r = 0, res = 0;
    bool stop = false;
    for (int i = 0; i < dir.length; i++){
      if (dir[i] == 'R') {
        r++;
      } else if (dir[i] == 'S'){
        res += r;
        r = 0;
        stop = true;
      } else if (r > 0){
        res += r + 1;
        r = 0;
        stop = true;
      } else if (stop){
        res++;
      }
      // print('i: $i, r: $r, res: $res');
    }
    return res;
  }
}