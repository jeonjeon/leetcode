from typing import List
from math import inf

class Solution:
    def maxTwoEvents(self, events: List[List[int]]) -> int:
        # $1: value, $2: end time
        res, mx = 0, 0
        arr = []
        
        for e in events:
            arr.append((e[0], True, e[2]))
            arr.append((e[1] + 1, False, e[2]))
        
        # Sorting the array based on time, and then by type
        arr.sort(key=lambda x: (x[0], x[1]))
        
        for t, s, v in arr:
            if s:
                res = max(res, mx + v)
            else:
                mx = max(mx, v)
        
        return res
