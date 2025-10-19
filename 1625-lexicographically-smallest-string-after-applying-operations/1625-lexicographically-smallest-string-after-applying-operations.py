class Solution:
    visit = set()
    def findLexSmallestString(self, s: str, a: int, b: int) -> str:
        if s in self.visit:
            return s
        self.visit.add(s)
#         rotate
        rot = self.findLexSmallestString(s[b:] + s[:b], a, b)
#         add
        for i in range(1, len(s))[::2]:
            s = s[:i] + str((int(s[i]) + a) % 10) + (s[i + 1:] if i < len(s) - 1 else '')
        add = self.findLexSmallestString(s, a, b)
        return min(rot, add)
        
            