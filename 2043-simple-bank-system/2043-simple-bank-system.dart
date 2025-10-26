class Bank {
  final List<int> blc;

  Bank(this.blc);
  
  bool transfer(int a1, int a2, int m) {
    if (a1 > blc.length || a2 > blc.length) return false;
    if (blc[a1 - 1] < m) return false;
    blc[a1 - 1] -= m;
    blc[a2 - 1] += m;
    return true;
  }
  
  bool deposit(int a, int m) {
    if (a > blc.length) return false;
    blc[a - 1] += m;
    return true;
  }
  
  bool withdraw(int a, int m) {
    if (a > blc.length) return false;
    if (blc[a - 1] < m) return false;
    blc[a - 1] -= m;
    return true;
  }
}

/**
 * Your Bank object will be instantiated and called as such:
 * Bank obj = Bank(balance);
 * bool param1 = obj.transfer(account1,account2,money);
 * bool param2 = obj.deposit(account,money);
 * bool param3 = obj.withdraw(account,money);
 */