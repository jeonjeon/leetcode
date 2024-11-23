class Solution:
    def rotateTheBox(self, box: List[List[str]]) -> List[List[str]]:
        res = []
       # 1.fall
        for i, v in enumerate(box):
            newB = []
            stones = 0
            for s in v:
                if s == '.':
                    newB.append('.')
                elif s == '#':
                    stones += 1
                else:
                    while stones > 0:
                        newB.append('#')
                        stones -= 1
                    newB.append('*')
            for _ in range(stones):
                newB.append('#')
            box[i] = newB
        # 2.rotate
        for i in range(len(box[0])):
            newB = []
            for j in range(len(box)):
                newB.append(box[j][i])
            res.append(reversed(newB))
        return res
        