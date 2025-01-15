class Solution {
  int minimizeXor(int num1, int num2) {
    int cnt = 0;
    while (num2 > 0){
        cnt += num2 & 1;
        num2 >>= 1;
    }
    final arr1 = List.filled(32, 0);
    final arr2 = List.filled(32, 0);
    for (int i = 0; i < 32; i++){
        if (num1 & (1 << i) > 0) arr1[i]++; 
    }
    for (int i = 31; i >= 0; i--){
        if (cnt == 0) continue;
        if (arr1[i] == 1){
            arr2[i] = 1;
            cnt--;
        }
    }
    for (int i = 0; i < 32; i++){
        if (cnt == 0) continue;
        if (arr2[i] == 1) continue;
        arr2[i] = 1;
        cnt--;
    }
    // print('arr1: $arr1');
    // print('arr2: $arr2');
    int res = 0;
    for (int i = 0; i < 32; i++){
        if (arr2[i] == 0) continue;
        res += 1 << i;
    }
    return res;
  }
}