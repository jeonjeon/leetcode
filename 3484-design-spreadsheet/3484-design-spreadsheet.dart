class Spreadsheet {

  final hm = <String, int>{};
  Spreadsheet(int rows); 
  
  void setCell(String cell, int value) => hm[cell] = value;
  
  void resetCell(String cell) => setCell(cell, 0);
  
  
  int getValue(String formula) => 
    formula.substring(1)
           .split('+')
           .map(_getNum)
           .reduce((a, b) => a + b);
  

  int _getNum(String str){
    final ps = int.tryParse(str);
    if (ps == null){
      return hm[str] ?? 0;
    }
    return ps!;
  }
}

/**
 * Your Spreadsheet object will be instantiated and called as such:
 * Spreadsheet obj = Spreadsheet(rows);
 * obj.setCell(cell,value);
 * obj.resetCell(cell);
 * int param3 = obj.getValue(formula);
 */