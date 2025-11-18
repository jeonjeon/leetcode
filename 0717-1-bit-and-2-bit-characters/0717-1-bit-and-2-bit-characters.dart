class Solution {
  bool isOneBitCharacter(List<int> bits) {
    if (bits.last == 1) return false;
    for (int i = 0; i < bits.length; i++){
        if (bits[i] == 1){
            if (i == bits.length - 2) return false;
            i++;
        }
    }
    return true;
  }
}