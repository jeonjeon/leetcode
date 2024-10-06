class Solution {
  bool areSentencesSimilar(String s1, String s2) {
    final arr1 = s1.split(' ').toList();
    final arr2 = s2.split(' ').toList();
    if (arr1.first != arr2.first && arr1.last != arr2.last) return false;
    final n1 = arr1.length, n2 = arr2.length;
    int l = 0, r = 1; 
    while(l < n1 && l < n2 && r <= n1 && r <= n2 && (arr1[l] == arr2[l] || arr1[n1 - r] == arr2[n2 - r])){
      if (arr1[l] == arr2[l]) l++;
      if (arr1[n1 - r] == arr2[n2 - r]) r++;
    }
    if (l > n1 - r || l > n2 - r) return true;
    return false;
  }
}