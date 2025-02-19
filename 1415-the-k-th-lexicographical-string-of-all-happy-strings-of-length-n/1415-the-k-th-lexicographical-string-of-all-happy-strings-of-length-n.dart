class Solution {
  String getHappyString(int n, int k) {
    final a = 'a'.codeUnitAt(0);
    final res = List.generate(n, (i) => i % 2 == 1 ? 1 : 0);
    for (int _ = 0; _ < k - 1; _++){
        int i = n - 1;
        for (;i > 0; i--){
            if (res[i] == 2) continue; // c면 한칸 앞으로
            if (res[i] == 1 && res[i - 1] == 2) continue; // b인데 앞칸이 c면 한칸 앞으로
            break;
        }
        if (i == 0 && res[i] == 2) return '';
        res[i]++;
        if (i > 0 && res[i] == res[i - 1]){
            res[i]++;
        }
        sort(res, i + 1);
    }
    return res.map((r) => String.fromCharCode(r + a))
              .join('');
  }
  void sort(List<int> arr, int si){
    for (int i = si; i < arr.length; i++){
        if (arr[i - 1] == 0) arr[i] = 1;
        else arr[i] = 0;
    }
  }
}