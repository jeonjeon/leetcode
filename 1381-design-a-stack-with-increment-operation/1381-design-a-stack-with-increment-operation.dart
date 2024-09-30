class CustomStack {
  final List<int> stack;
  int p = -1;

  CustomStack(int maxSize) :
    this.stack = List.filled(maxSize, 0);
  
  
  void push(int x) {
    if (stack.length - 1 == p) return;
    p++;
    stack[p] = x;
  }
  
  int pop() {
    if (p == -1) return -1;
    final res = stack[p];
    p--;
    return res;
  }
  
  void increment(int k, int val) {
    final n = min(k, stack.length);
    for (int i = 0; i < n; i++){
      stack[i] += val;
    }
  }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * CustomStack obj = CustomStack(maxSize);
 * obj.push(x);
 * int param2 = obj.pop();
 * obj.increment(k,val);
 */