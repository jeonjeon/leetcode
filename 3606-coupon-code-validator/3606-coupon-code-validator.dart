class Solution {
  List<String> validateCoupons(List<String> code, List<String> businessLine, List<bool> isActive) {
    final res = <String>[];
    final c = RegExp(r'^[a-zA-Z0-9_]+$');
    final b = <String, List<String>>{'electronics' : [], 'grocery': [], 'pharmacy': [], 'restaurant': []};
    for (int i = 0; i < code.length; i++){
      if (!c.hasMatch(code[i])) continue;
      if (!b.containsKey(businessLine[i])) continue;
      if (!isActive[i]) continue;
      b[businessLine[i]]!.add(code[i]);
    }
    b.values.forEach((cs) => cs.sort());
    return b.values.expand((a) => a).toList();
  }
}