class Solution {
  String smallestEquivalentString(String s1, String s2, String baseStr) {
    final a = 'a'.codeUnitAt(0);
    final parent = List.generate(26, (i) => i);
    String res = '';
    for (int i = 0; i < s1.length; i++){
      union(s1.codeUnitAt(i) - a, s2.codeUnitAt(i) - a, parent);
    }
    // print(parent);
    for (int i = 0; i < baseStr.length; i++){
      res += String.fromCharCode(find(baseStr.codeUnitAt(i) - a, parent) + a);
    }
    return res;
    
  }
  int find(int child, List<int> parent){
    if (parent[child] != child){
      parent[child] = find(parent[child], parent);
    }
    return parent[child];
  }
  void union(int a, int b, List<int> parent){
    a = find(a, parent);
    b = find(b, parent);
    if (a < b){
      parent[b] = a;
    } else {
      parent[a] = b;
    }
    
  }
}