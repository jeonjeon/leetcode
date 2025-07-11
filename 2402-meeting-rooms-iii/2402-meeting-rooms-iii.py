class Solution:
    def mostBooked(self, n: int, meetings: List[List[int]]) -> int:
        # 각 방의 사용 회수
        useCount = [0] * n
        available = [i for i in range(n)]
        heapify(available)
        occupied = []
        for start, end in sorted(meetings):
            # 현재 시점에 회의가 끝난 방들 다시 available로 이동
            while occupied and occupied[0][0] <= start:
                _, roomNum = heappop(occupied)
                heappush(available, roomNum)        
            # 방이 다 찼을 때
            if not available:
                preEnd, roomNum = heappop(occupied)
                heappush(available, roomNum)
                end = preEnd + end - start

            roomNum = heappop(available)
            heappush(occupied,[end, roomNum])
            useCount[roomNum] += 1
        res = 0
        mx = 0
        for i in range(n):
          if useCount[i] > mx:
            mx = useCount[i]
            res = i
        return res



# import 'dart:math';
# import 'dart:collection';
# class Solution {
#   int mostBooked(int n, List<List<int>> meetings) {
#     meetings.sort((a,b) => a[0].compareTo(b[0]));

#     // 방
#     final occupied = MinHeap();
#     final available = MinHeap();
#     for (int i = 0; i < n; i++){
#       available.add((i,i));
#     }

    
#     final useCount = List.filled(n, 0);
 
    
#     for (int i = 0; i < meetings.length; i++){
#       final meet = meetings[i];

     
      
#     }
#     while (!occupied.isEmpty){
#       print(occupied.pop());
#     }
#     int res = 0;
#     int mx = 0;
#     for (int i = 0; i < n; i++){
#       if (useCount[i] > mx){
#         mx = useCount[i];
#         res = i;
#       }
#     }
#     return res;
#   }
# }
