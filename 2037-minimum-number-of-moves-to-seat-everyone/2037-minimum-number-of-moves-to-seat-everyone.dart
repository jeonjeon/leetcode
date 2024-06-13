class Solution {
  int minMovesToSeat(List<int> seats, List<int> students) {
    int res = 0;
    seats.sort();
    students.sort();
    for(int i = 0; i < seats.length; i++){
      res += (seats[i] - students[i]).abs();
    }
    return res;
  }
}