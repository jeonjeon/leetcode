class Solution {
    String getHappyString(int n, int k) {
        final res = List.generate(n, (i) => i % 2 == 1 ? 1 : 0);
        for (int _ = 0; _ < k - 1; _++) {
            int i = n - 1;
            // Find the rightmost position that can be incremented
            while (i > 0 && (res[i] == 2 || res[i] == 1 && res[i - 1] == 2)) {
                i--;
            }
            
            // If the highest possible value is reached, return an empty string
            if (i == 0 && res[i] == 2) return "";

            res[i]++; // Increment the current position
            
            // If the new value is the same as the previous one, increment again
            if (i > 0 && res[i] == res[i - 1]) {
                res[i]++;
            }

            sort(res, i + 1); // Reorder the following sequence in alternating pattern
        }
        
        final a = 'a'.codeUnitAt(0);
        return res.map((r) => String.fromCharCode(r + a)).join('');
    }

    // Reset the sequence from index `si` in alternating pattern: ababab... or bababa...
    void sort(List<int> arr, int si) {
        for (int i = si; i < arr.length; i++) {
            if (arr[i - 1] == 0) arr[i] = 1;
            else arr[i] = 0;
        }
    }
}
