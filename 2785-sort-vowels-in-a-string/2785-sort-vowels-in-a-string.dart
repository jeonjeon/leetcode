class Solution {
  String sortVowels(String s) {
    final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
    final res = List.generate(s.length, (_) => '');
    final v = <String>[];
    for (int i = 0; i < s.length; i++){
        if (vowels.contains(s[i])){
            v.add(s[i]);
            continue;
        }
        res[i] = s[i];
    }
    v.sort();
    int vi = 0;
    for (int i = 0; i < s.length; i++){
        if (res[i].isEmpty){
            res[i] = v[vi++];
        }
    }
    return res.join('');
  }
}