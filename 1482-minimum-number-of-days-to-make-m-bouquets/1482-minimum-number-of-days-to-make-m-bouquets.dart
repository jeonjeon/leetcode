class Solution {
  int minDays(List<int> day, int m, int k) {
    final n = day.length;
    // k개씩 m개의 부케를 만들어야 함으로 n이 최소한 m * k 있어야함
    if (m * k > n){
      return -1;
    }
    int l = 1;
    int r = 1000000001;
    // binary search를 통해 가능한 최소 시간을 탐색한다
    while (l <= r){
      final mid = (l + r) ~/ 2;
      if (canMake(day, m, k, mid)){
        r = mid - 1;
      } else {
        l = mid + 1;
      }
    }
    //끝
    return l;
  }
  // 해당 시간에 모든 부케를 만드는 것이 가능한지 o(n) 시간에 찾아주는 메소드
  bool canMake(List<int> day, int m, int k, int mid){
    // mid 시간 내에 피어나는 인접한 꽃의 개수
    int cnt = 0;
    for (final d in day){
      // 현재 꽃이 mid 시간 내에 필 수 있는다면
      if (d <= mid){
        // 개수를 세어줌
        cnt++;
      } else {
        // 그렇지 않다면 0으로 초기화
        cnt = 0;
      }
      // 만약 mid 시간내에 피어나는 인접한 꽃의 개수가 k개라면 부케 하나를 만들수 있음
      // 따라서 m을 하나 차감해주면서 cnt를 다시 0으로 초기화
      if (cnt == k){
        cnt = 0;
        m--;
      }
      // m이 0이된다면 모든 부케를 제작 가능함 true
      if (m == 0){
        return true;
      }
    }
    // 모든 부케를 제작하는데 실패했음으로 false
    return false;
  }
}