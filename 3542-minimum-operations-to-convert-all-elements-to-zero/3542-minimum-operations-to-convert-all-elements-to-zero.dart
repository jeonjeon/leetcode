class Solution {
  int minOperations(List<int> nums) {
    final stack = <int>[];
    var visit = <int>{0};
    int res = 0;
    for (final n in nums){
        while (stack.isNotEmpty && stack.last > n){
            final last = stack.removeLast();
            if (visit.contains(last)) continue;
            res++;
            visit.add(last);
        }
        visit = {0};
        stack.add(n);
    }

    while (stack.isNotEmpty){
        final last = stack.removeLast();
        if (visit.contains(last)) continue;
        res++;
        visit.add(last);
    }
    return res;
  }
}