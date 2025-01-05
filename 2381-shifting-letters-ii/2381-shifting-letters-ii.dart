class Solution {
  String shiftingLetters(String s, List<List<int>> shifts) {
    final a = 'a'.codeUnitAt(0);
    final arr = s.split('').map((ss) => ss.codeUnitAt(0) - a).toList();
    final sft = <(int, int)>[];
    for (final shift in shifts){
        final dir = shift[2] == 1 ? 1 : -1;
        sft.add((shift[0], dir));
        sft.add((shift[1] + 1, -dir));
    }
    sft.sort((x, y) => y.$1.compareTo(x.$1));
    int cur = 0;
    // print(sft);
    for (int i = 0; i < arr.length; i++){
        while (sft.isNotEmpty && sft.last.$1 == i){
            final (_, dir) = sft.removeLast();
            cur += dir;
        }
        // print('i: $i, cur: $cur');
        arr[i] += cur;
        if (arr[i] < 0) arr[i] += 26;
        arr[i] %= 26;
    }
    return arr.map((c) => String.fromCharCode(c + a)).join('');
  }
}