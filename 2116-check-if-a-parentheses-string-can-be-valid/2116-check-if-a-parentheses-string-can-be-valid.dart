class Solution {
  bool canBeValid(String s, String locked) {
    if(s.length % 2 == 1) return false;
    int left = 0, right = 0, any = 0;
    for (int i = 0; i < s.length; i++){
        if (locked[i] == '0'){
            any++;
            continue;
        }
        if (s[i] == '('){
            left++;
            continue;
        }
        right++;
        if (right > left + any){
            return false;
        }
    }
    left = 0; 
    right = 0; 
    any = 0;
    for (int i = s.length - 1; i >= 0; i--){
        if (locked[i] == '0'){
            any++;
            continue;
        }
        if (s[i] == ')'){
            right++;
            continue;
        }
        left++;
        if (left > right + any){
            return false;
        }
    }
    return true;
  }
}