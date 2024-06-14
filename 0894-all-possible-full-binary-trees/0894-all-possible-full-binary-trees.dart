/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  final hm = <int, List<TreeNode>>{0: [TreeNode()]};
  List<TreeNode?> allPossibleFBT(int n) {
    if (n % 2 == 0) return [];
    if (n == 1) return [TreeNode()];
    n -= 3;
    final arr = <TreeNode>[];
    for(int i = 0; i <= n; i += 2){
      final left = dfs(i);
      final right = dfs(n - i);
      for (final l in left){
        for (final r in right){
          arr.add(TreeNode(0, l, r));
        }
      }
    }
    return arr;
  }
  List<TreeNode> dfs(int n){
    //print('n: $n, hm: $hm');
    if (hm.containsKey(n)){
      return hm[n]!;
    }
    final arr = <TreeNode>[];
    final next = n - 2;
    for(int i = 0; i <= next; i += 2){
      final left = dfs(i);
      final right = dfs(next - i);
      for (final l in left){
        for (final r in right){
          arr.add(TreeNode(0, l, r));
        }
      }
    }
    hm[n] = arr;
    return hm[n]!;
  }
}