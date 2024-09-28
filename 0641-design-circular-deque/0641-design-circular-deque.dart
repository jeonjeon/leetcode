class MyCircularDeque {
  final int k;
  final arr = List.filled(10000, 0);
  int l = 5000;
  int r = 4999;
  MyCircularDeque(this.k); 
  
  bool insertFront(int value) {
    if (isFull()) return false;
    arr[--l] = value;
    return true;
  }
  
  bool insertLast(int value) {
    if (isFull()) return false;
    arr[++r] = value;
    return true;
  }
  
  bool deleteFront() {
    if (isEmpty()) return false;
    l++;
    return true;
  }
  
  bool deleteLast() {
    if (isEmpty()) return false;
    r--;
    return true;
  }
  
  int getFront() {
    if (isEmpty()) return -1;
    return arr[l];
  }
  
  int getRear() {
    if (isEmpty()) return -1;
    return arr[r];
  }
  
  bool isEmpty() => r < l;
  bool isFull() => r - l + 1 == k;
  
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * MyCircularDeque obj = MyCircularDeque(k);
 * bool param1 = obj.insertFront(value);
 * bool param2 = obj.insertLast(value);
 * bool param3 = obj.deleteFront();
 * bool param4 = obj.deleteLast();
 * int param5 = obj.getFront();
 * int param6 = obj.getRear();
 * bool param7 = obj.isEmpty();
 * bool param8 = obj.isFull();
 */