class Solution {
  List<int> getNoZeroIntegers(int n) {
    for (int i = 1; i < n; i++){
       if (hasZero(i)) continue;
       if (hasZero(n - i)) continue;
       return [i, n - i];
    }
    return [1,1];
  }
  
  bool hasZero(n){
    while (n > 0){
        if (n % 10 == 0) return true;
        n ~/= 10;
    }
    return false;
  }
    
  
}