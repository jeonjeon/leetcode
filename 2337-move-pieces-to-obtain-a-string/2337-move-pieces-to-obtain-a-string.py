class Solution:
    def canChange(self, start: str, target: str) -> bool:
        l = len(start)
        si, ti = 0, 0
        while ti < l or si < l:
            while si < l and start[si] == '_':
                si += 1
            while ti < l and target[ti] == '_':
                ti += 1
            if si >= l and ti >= l:
                return True
            if si >= l or ti >= l:
                return False
            if target[ti] != start[si]:
                return False
            if start[si] == 'R' and ti < si:
                return False
            if start[si] == 'L' and ti > si:
                return False
            si += 1
            ti += 1
        return True
        