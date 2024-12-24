import 'dart:math';
class Solution {
  int minimumDiameterAfterMerge(List<List<int>> edges1, List<List<int>> edges2) {
    final (len1, even1) = getMinHeight(edges1);
    final (len2, even2) = getMinHeight(edges2);
    return max(len1 + len2 + 1, max(len1 * 2 - even1, len2 * 2 - even2));
  }
  (int, int) getMinHeight(List<List<int>> edges){
    var res = 0;
    var even = 1;
    var stack = <int>[];
    final hm = <int, Set<int>>{};
    for (final e in edges){
        (hm[e[0]] ??= {}).add(e[1]);
        (hm[e[1]] ??= {}).add(e[0]);
    }
    hm.keys.where((k) => hm[k]!.length == 1)
           .forEach(stack.add);
    // print(stack);
    while (stack.isNotEmpty){
        res++;
        final temp = <int>[];
        while (stack.isNotEmpty){
            final cur = stack.removeLast();
            final next = hm[cur]!.toList();
            for (final n in next){
                hm[n]!.remove(cur);
                if (hm[n]!.length == 1){
                    temp.add(n);
                }
            }
        }
        stack = temp;
        // if remain node is one
        // it is not even
        if (stack.length == 1) {
            even = 0;
            break;
        }
    }
    return (res, even);
  }
}