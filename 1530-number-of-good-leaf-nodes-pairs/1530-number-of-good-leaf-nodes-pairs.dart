/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
import 'dart:collection';
class Solution {
  int countPairs(TreeNode? root, int dist) {
    final edges = getEdges(root!);
    if (edges.length == 1) return 0;
    return goodPairs(edges, dist);
  }
  int goodPairs(Map<int, List<int>> edges, int dist){
    int res = 0;
    final leaves = edges.entries
                        .where((e) => e.value.length == 1)
                        .map((e) => e.key)
                        .toSet();
    leaves.remove(0);
    var q = Queue<(int, int)>.from(leaves.map((e) => (e, e)));
    int cnt = 0;
    while (q.isNotEmpty && cnt < dist){
      final temp = Queue<(int, int)>();
      while (q.isNotEmpty){
        final (cur, prev) = q.removeFirst();
        final next = edges[cur]!;
        for (final n in next){
          if (n == prev) continue;
          if (leaves.contains(n)) {
            res++;
            continue;
          }
          temp.add((n, cur));
        }
      }
      cnt++;
      q = temp;
    }
    return res ~/ 2;
  }
  Map<int, List<int>> getEdges(TreeNode root){
    int cnt = 0;
    root.val = cnt;
    final edges = <int, List<int>>{};
    final q = Queue<TreeNode>()..add(root!);
    while (q.isNotEmpty){
      final cur = q.removeFirst();
      edges[cur.val] ??= [];
      if (cur.left != null){
        cnt++;
        cur.left!.val = cnt;
        edges[cur.val]!.add(cnt);
        edges[cnt] = [cur.val];
        q.add(cur.left!);
      }
      if (cur.right != null){
        cnt++;
        cur.right!.val = cnt;
        edges[cur.val]!.add(cnt);
        edges[cnt] = [cur.val];
        q.add(cur.right!);
      }
    }
    return edges;
  }
}