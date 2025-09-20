class Router {
  final int limit;
  final q = <List<int>>[]; // [source, destination, timestamp]
  final dest = <int, List<List<int>>>{}; // {destination: [index, timestamp]}
  final dup = <int, Set<String>>{}; // {timestamp: {'source,destination'}}
  int cur = 0;

  Router(this.limit);
  
  bool addPacket(int s, int d, int t) {
    final newP = [s, d, t];
    if (dup.containsKey(t) && dup[t]!.contains('$s,$d')){
      return false;
    }
    // check exceed
    if (q.length - cur == limit) forwardPacket();
    q.add(newP);
    (dup[t] ??= <String>{}).add('$s,$d');
    (dest[d] ??= <List<int>>[]).add([q.length - 1, t]);
    return true;
  }
  
  List<int> forwardPacket() {
    if (q.length <= cur) return [];
    final [s, d, t] = q[cur++];
    // bs
    final dst = dest[d]!;
    int l = 0, r = dst.length - 1;
    while (l < r){
      final mid = (l + r) ~/ 2;
      if (dst[mid][0] >= 0){
        r = mid;
      } else {
        l = mid + 1;
      }
    }
    dst[l] = [-1, -1];
    // remove dup
    dup[t]!.remove('$s,$d');
    return [s,d,t];
  }
  
  int getCount(int d, int start, int end) {
    if (!dest.containsKey(d)) return 0;
    final dst = dest[d]!;
    // print('dst: $dst');
    int l = 0, r = dst.length;
    while (l < r){
      final mid = (l + r) ~/ 2;
      if (dst[mid][1] >= start){
        r = mid;
      } else {
        l = mid + 1;
      }
    }
    final s = l;
    if (s == dst.length) return 0;
    l = -1; 
    r = dst.length - 1;
    while (l < r){
      final mid = ((l + r) / 2).ceil();
      if (dst[mid][1] > end){
        r = mid - 1;
      } else {
        l = mid;
      }
    }
    final e = l;
    if (e < 0) return 0;
    // print('s: $s, e: $e');
    return e - s + 1;
  }
}

/**
 * Your Router object will be instantiated and called as such:
 * Router obj = Router(memoryLimit);
 * bool param1 = obj.addPacket(source,destination,timestamp);
 * List<int> param2 = obj.forwardPacket();
 * int param3 = obj.getCount(destination,startTime,endTime);
 */