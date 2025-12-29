class Solution {
    bool pyramidTransition(String bottom, List<String> allowed) {
        final hm = <String, List<String>>{};
        for (final all in allowed){
            final prefix = all[0] + all[1];
            if (!hm.containsKey(prefix)){
                hm[prefix] = <String>[];
            }
            hm[prefix]!.add(all[2]);
        }
        return dfs(bottom, 0, '', hm, <String>{});
    }
    
    bool dfs(final bottom, final idx, final top, final hm, final memo) {
        if (bottom.length == 1){
            return true;
        }
        if (memo.contains(top)){
            return false;
        }
        if (bottom.length - 1 == idx){
            return dfs(top, 0, '', hm,memo);
        }
        final prefix = bottom[idx] + bottom[idx + 1];
        if (!hm.containsKey(prefix)){
            return false;
        }
        for (String t in hm[prefix]){
            if (top.isNotEmpty && !hm.containsKey(top[top.length - 1] + t)){
                continue;
            }
            if (dfs(bottom, idx + 1, top + t, hm,memo)){
                return true;
            }
        }
        memo.add(top);
        return false;
    }
}