const vowels = {'a', 'e', 'i', 'o', 'u'};
class Solution {
  List<String> spellchecker(List<String> wordlist, List<String> queries) {
    final res = <String>[];
    final origin = wordlist.toSet();
    final low = <String, String>{};
    final vow = <String, String>{};
    for (final w in wordlist){
        final lower = w.toLowerCase();
        low[lower] ??= w;
        final vowel = lower.replaceAll(RegExp(r'[aeiou]'), ' ');
        vow[vowel] ??= w;
    }
    // print(origin);
    // print(low);
    // print(vow);
    for (final q in queries){
        if (origin.contains(q)) {
            res.add(q);
            continue;
        }
        final lower = q.toLowerCase();
        if (low.containsKey(lower)){
            res.add(low[lower]!);
            continue;
        }
        final vowel = lower.replaceAll(RegExp(r'[aeiou]'), ' ');
        if (vow.containsKey(vowel)){
            res.add(vow[vowel]!);
            continue;
        }
        res.add('');
    }
    return res;
  }
}