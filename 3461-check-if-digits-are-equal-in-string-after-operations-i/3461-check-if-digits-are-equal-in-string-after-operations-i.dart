class Solution {
  bool hasSameDigits(String s) {
    var arr = s.split('').map(int.parse).toList();
    while (arr.length > 2){
        final temp = <int>[];
        for (int i = 1; i < arr.length; i++){
            temp.add((arr[i] + arr[i - 1]) % 10);
        }
        arr = temp;
    }
    return arr[0] == arr[1];
  }
}