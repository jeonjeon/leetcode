class Solution {
  String decodeCiphertext(String txt, int rows) {
    final decode = <String>[];
    final n = txt.length;
    final col = n ~/ rows;
    for (int i = 0; i < col; i++){
      for (int j = 0; j < rows; j++){
        final idx = i + col * j + j;
        if (idx >= n) break;
        decode.add(txt[idx]);
      }
    }
    return decode.join('').trimRight();
  }
}