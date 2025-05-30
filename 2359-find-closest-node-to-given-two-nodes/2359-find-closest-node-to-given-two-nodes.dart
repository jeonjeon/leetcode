import 'dart:collection';
import 'dart:math';
class Solution {
  int closestMeetingNode(List<int> edges, int node1, int node2) {
      final visit1 = <int>{};
      final visit2 = <int>{};
      final edgeMap = <int, List<int>>{};
      int res = 100000;
      for (int i = 0; i < edges.length; i++){
          edgeMap[i] ??= <int>[];
          if (edges[i] == -1) continue;
          edgeMap[i]!.add(edges[i]);
      }
      var q = Queue<List<int>>();
      visit1.add(node1);
      visit2.add(node2);
      q.add([1,node1]);
      q.add([2,node2]);
      print('edgeMap: $edgeMap');
      while (q.isNotEmpty && res == 100000){
          final temp = Queue<List<int>>();
          while (q.isNotEmpty){
              final currArr = q.removeFirst();
              final pos = currArr[0];
              final val = currArr[1];
              if (pos == 1) {
                  //   1번이 2번이 방문한 곳을 방문하면 만남성공
                  if (visit2.contains(val)){
                    //   print(val)
                      res = min(res, val);
                      continue;
                  }
                  visit1.add(val);
                  final children = edgeMap[val]!;
                  for (final child in children){
                      if (!visit1.contains(child)){
                          temp.add([1,child]);
                      }
                  }
              }
              if (pos == 2) {
                  if (visit1.contains(val)){
                      res = min(res, val);
                      continue;
                  }
                  visit2.add(val);
                  final children = edgeMap[val]!;
                  for (final child in children){
                      if (!visit2.contains(child)){
                          temp.add([2,child]);
                      }
                  }
              }
          }
          q = temp;
      }
      return res == 100000 ? -1 : res;
  }
}