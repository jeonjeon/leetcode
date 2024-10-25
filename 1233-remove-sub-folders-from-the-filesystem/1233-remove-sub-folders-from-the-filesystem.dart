class Solution {
  List<String> removeSubfolders(List<String> folder) {
    final sett = folder.toSet();
    final remove = <String>[];
    for (final w in sett){
        for (int i = 1; i < w.length; i++){
            if (w[i] == '/'){
                if (sett.contains(w.substring(0, i))){
                    remove.add(w);
                }
            }
        }
    }
    for (final r in remove){
        sett.remove(r);
    }
    return sett.toList();
  }
}