class Solution {
  bool canChange(String start, String target) {
    int si = 0;
    for (int ti = 0; ti < start.length; ti++){
        // pass spaces from both start and target
        if (target[ti] == '_') continue;
        while (si < start.length && start[si] == '_') si++;
        // check valid
        if (si >= start.length) return false;
        if (target[ti] != start[si]) return false;
        if (target[ti] == 'L' && ti > si) return false;
        if (target[ti] == 'R' && ti < si) return false;
        si++;
    }
    for (si; si < start.length; si++){
        if (start[si] != '_') return false;
    }
    return true;
  }
}