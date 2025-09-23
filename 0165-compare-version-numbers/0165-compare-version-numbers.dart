class Solution {
  int compareVersion(String version1, String version2) {
    final v1 = version1.split('.').map(int.parse).toList();
    final v2 = version2.split('.').map(int.parse).toList();
    final l1 = v1.length, l2 = v2.length;
    for (int i = 0; i < 500; i++){
      int n1 = 0, n2 = 0;
      if (i < l1) n1 = v1[i];
      if (i < l2) n2 = v2[i];
      if (n1 < n2) return -1;
      if (n1 > n2) return 1;
    }
    return 0;
  }
}