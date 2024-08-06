class Solution {
  int minimumPushes(String word) {
    // 해시맵을 통해 전체 문자에서 나타난 각 글자들의 출현 빈도 파악
    final hm = <String, int>{};
    for (int i = 0; i < word.length; i++){
      hm[word[i]] = (hm[word[i]] ?? 0) + 1;
    }
    // 정보이론에 맞게 빈도가 많은 글자를 최대한 적게 누르게 리맵
    final values = hm.values.toList()..sort((a, b) => b.compareTo(a));
    int res = 0;
    // 맵 가능한 키는 8개 이기 때문에 8개 단위로 눌러야 하는 카운트는 상승한다
    for (int i = 0; i < values.length; i++){
      final pushCount = i ~/ 8 + 1;
      res += values[i] * pushCount;
    }
    return res;
  }
}
