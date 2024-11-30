class Solution:
    def __init__(self):
        self.res = []

    def validArrangement(self, pairs):
        graph = {}
        cnt = {}
        for p in pairs:
            graph.setdefault(p[0], []).append(p[1])
            cnt[p[0]] = cnt.get(p[0], 0) + 1
            cnt[p[1]] = cnt.get(p[1], 0) - 1
        s = pairs[0][0]
        for key, value in cnt.items():
            if value == 1:
                s = key
                break
        self.dfs(graph, s)
        return self.res[::-1]

    def dfs(self, graph, cur):
        if cur not in graph:
            return
        next_nodes = graph[cur]
        while next_nodes:
            n = next_nodes.pop()
            self.dfs(graph, n)
            self.res.append([cur, n])
