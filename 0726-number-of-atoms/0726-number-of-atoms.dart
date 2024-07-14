class Solution {
  final A = 'A'.codeUnitAt(0);
  final Z = 'Z'.codeUnitAt(0);
  final a = 'a'.codeUnitAt(0);
  final z = 'z'.codeUnitAt(0);

  String countOfAtoms(String formula) {
    final stack = <Map<String, int>>[{}];
    var i = 0;

    while (i < formula.length) {
      if (formula[i] == '(') {
        stack.add({});
        i++;
      } else if (formula[i] == ')') {
        i++;
        var num = 0;
        while (i < formula.length && formula[i].codeUnitAt(0).isDigit) {
          num = num * 10 + int.parse(formula[i]);
          i++;
        }
        num = num == 0 ? 1 : num;
        final top = stack.removeLast();
        final last = stack.last;
        top.forEach((k, v) => last[k] = (last[k] ?? 0) + v * num);
      } else {
        var start = i;
        i++;
        while (i < formula.length && formula[i].codeUnitAt(0).isLowerCase) i++;
        final name = formula.substring(start, i);
        start = i;
        while (i < formula.length && formula[i].codeUnitAt(0).isDigit) i++;
        final num = start < i ? int.parse(formula.substring(start, i)) : 1;
        final last = stack.last;
        last[name] = (last[name] ?? 0) + num;
      }
    }

    final result = <String>[];
    final countMap = stack.last;
    final sortedKeys = countMap.keys.toList()..sort();
    for (final key in sortedKeys) {
      result.add(key + (countMap[key] == 1 ? '' : countMap[key].toString()));
    }
    return result.join('');
  }
}

extension on int {
  bool get isDigit => this >= '0'.codeUnitAt(0) && this <= '9'.codeUnitAt(0);
  bool get isLowerCase => this >= 'a'.codeUnitAt(0) && this <= 'z'.codeUnitAt(0);
}
