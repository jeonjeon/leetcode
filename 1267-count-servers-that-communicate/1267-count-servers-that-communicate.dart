class Solution {
  int countServers(List<List<int>> grid) {
    int server = 0;
    final singleRow = <int>{};
    for (int i = 0; i < grid.length; i++){
        final rows = <int>{};
        for (int j = 0; j < grid[0].length; j++){
            if (grid[i][j] == 0) continue;
            rows.add(j);
            server++;
        }
        if (rows.length == 1){
            singleRow.addAll(rows);
        }
    }
    for (int j = 0; j < grid[0].length; j++){
        int cnt = 0;
        for (int i = 0; i < grid.length; i++){
            if (grid[i][j] == 0) continue;
            cnt++;
        }
        if (cnt > 1) singleRow.remove(j);
    }
    return server - singleRow.length;
  }
}