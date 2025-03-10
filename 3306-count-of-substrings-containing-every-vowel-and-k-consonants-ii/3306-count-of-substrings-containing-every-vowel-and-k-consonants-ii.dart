class Solution {
  int countOfSubstrings(String word, int k) {
    final vowels = {'a' : 0, 'e' : 0, 'i' : 0, 'o' : 0, 'u': 0};
    int l = 0, con = 0, prevCon = -1, res = 0;
    for (int r = 0; r < word.length; r++){
        if (vowels.containsKey(word[r])){
            vowels[word[r]] = vowels[word[r]]! + 1;
        } else {
            con++;
        }
        if (con < k) continue;
        while (con > k){
            if (vowels.containsKey(word[l])){
                vowels[word[l]] = vowels[word[l]]! - 1;
            } else {
                con--;
                prevCon = l;
            }
            l++;
        }
        while (vowels.values.every((v) => v > 0) && vowels.containsKey(word[l])){
            if (vowels[word[l]] == 1) break;
            vowels[word[l]] = vowels[word[l]]! - 1;
            l++;
        }
        if (vowels.values.every((v) => v > 0)){
            res += l - prevCon;
        }
    }
    return res;
  }
}