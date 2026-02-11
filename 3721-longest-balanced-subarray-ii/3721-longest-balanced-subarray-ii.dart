class Node {
  int mn;    // 구간의 최솟값
  int mx;    // 구간의 최댓값
  int lazy;  // lazy propagation 값
  
  Node({this.mn = 0x7FFFFFFF, this.mx = -0x7FFFFFFF, this.lazy = 0});
}

class SegmentTree {
  late List<Node> segTree;
  late int n;
  
  SegmentTree(List<int> v) : n = v.length {
    // 4n 크기의 트리 생성 (완전 이진 트리를 위한 충분한 공간)
    segTree = List.generate(4 * n, (_) => Node());
    buildTree(0, 0, n - 1, v);
  }
  
  /// ========================================
  /// 1. BUILD TREE: 초기 세그먼트 트리 구축
  /// ========================================
  /// 예시: v = [1, -1, 0, 1]
  /// 
  /// 트리 구조:
  ///           [mn:-1, mx:1]
  ///          /              \
  ///    [mn:-1, mx:1]    [mn:0, mx:1]
  ///     /        \         /       \
  ///  [1,1]   [-1,-1]   [0,0]    [1,1]
  ///
  void buildTree(int i, int l, int r, List<int> v) {
    // 리프 노드: 단일 원소
    if (l == r) {
      segTree[i].mn = segTree[i].mx = v[l];
      return;
    }
    
    int mid = (l + r) ~/ 2;
    // 왼쪽 자식: 2*i+1, 오른쪽 자식: 2*i+2
    buildTree(2 * i + 1, l, mid, v);
    buildTree(2 * i + 2, mid + 1, r, v);
    
    // 부모 노드는 자식들의 min/max 값을 가짐
    segTree[i].mn = segTree[2 * i + 1].mn < segTree[2 * i + 2].mn 
        ? segTree[2 * i + 1].mn 
        : segTree[2 * i + 2].mn;
    segTree[i].mx = segTree[2 * i + 1].mx > segTree[2 * i + 2].mx 
        ? segTree[2 * i + 1].mx 
        : segTree[2 * i + 2].mx;
  }
  
  /// ========================================
  /// 2. PUSH DOWN: Lazy Propagation
  /// ========================================
  /// Lazy 값을 자식에게 전파하고 현재 노드에 반영
  /// 
  /// 예시: lazy = 5인 노드
  /// Before:  [mn:2, mx:8, lazy:5]
  /// After:   [mn:7, mx:13, lazy:0]  <- 자식들은 lazy:5 받음
  ///
  void pushDown(int i, int l, int r) {
    if (segTree[i].lazy == 0) return;
    
    // 현재 노드의 min/max에 lazy 값 적용
    segTree[i].mn += segTree[i].lazy;
    segTree[i].mx += segTree[i].lazy;
    
    // 리프 노드가 아니면 자식에게 lazy 전파
    if (l != r) {
      segTree[2 * i + 1].lazy += segTree[i].lazy;
      segTree[2 * i + 2].lazy += segTree[i].lazy;
    }
    
    segTree[i].lazy = 0;  // 현재 노드 lazy 초기화
  }
  
  /// ========================================
  /// 3. UPDATE RANGE: 구간 업데이트
  /// ========================================
  /// [start, end] 구간의 모든 값에 val을 더함
  /// 
  /// 예시: updateRange(1, 3, +2)
  /// [0, 1, 2, 3, 4] -> [0, 3, 4, 5, 4]
  ///
  /// 동작 과정:
  /// 1. pushDown으로 pending lazy 처리
  /// 2. 구간이 완전히 포함되면 lazy 설정 후 종료
  /// 3. 부분 겹침이면 자식으로 재귀
  /// 4. 자식 업데이트 후 부모의 min/max 갱신
  ///
  void updateRangeQuery(int start, int end, int i, int l, int r, int val) {
    // Step 1: 현재 노드의 pending lazy 처리
    pushDown(i, l, r);
    
    // Step 2: 범위 밖이면 리턴
    if (l > end || r < start || l > r) {
      return;
    }
    
    // Step 3: [l, r]이 [start, end]에 완전히 포함됨
    // -> lazy 설정하고 종료 (자식은 나중에 필요할 때 pushDown)
    if (l >= start && r <= end) {
      segTree[i].lazy += val;
      pushDown(i, l, r);
      return;
    }
    
    // Step 4: 부분 겹침 -> 자식으로 재귀
    int mid = (l + r) ~/ 2;
    updateRangeQuery(start, end, 2 * i + 1, l, mid, val);
    updateRangeQuery(start, end, 2 * i + 2, mid + 1, r, val);
    
    // 자식 업데이트 후 부모 노드 갱신
    segTree[i].mn = segTree[2 * i + 1].mn < segTree[2 * i + 2].mn 
        ? segTree[2 * i + 1].mn 
        : segTree[2 * i + 2].mn;
    segTree[i].mx = segTree[2 * i + 1].mx > segTree[2 * i + 2].mx 
        ? segTree[2 * i + 1].mx 
        : segTree[2 * i + 2].mx;
  }
  
  /// ========================================
  /// 4. FIND RIGHTMOST ZERO: 핵심 함수!
  /// ========================================
  /// 0이 존재하는 가장 오른쪽 인덱스를 찾음
  /// 
  /// 동작 원리:
  /// 1. [mn, mx] 범위에 0이 없으면 -1 리턴
  /// 2. 리프 노드면 현재 인덱스 리턴
  /// 3. 오른쪽 자식부터 탐색 (rightmost 찾기 위해)
  /// 4. 오른쪽에 없으면 왼쪽 탐색
  ///
  /// 예시: [1, 0, -1, 0, 2]에서 rightmost zero 찾기
  /// 
  ///              [mn:-1, mx:2] <- 0 가능
  ///             /              \
  ///        [mn:-1, mx:1]    [mn:0, mx:2] <- 오른쪽부터!
  ///                          /         \
  ///                      [0,0] ✓    [2,2]
  /// 
  /// 탐색 순서: 루트 -> 오른쪽 서브트리 -> 인덱스 3 반환
  ///
  int findRightMostZero(int i, int l, int r) {
    pushDown(i, l, r);
    
    int minEle = segTree[i].mn;
    int maxEle = segTree[i].mx;
    
    // [mn, mx] 범위에 0이 없으면 -1
    // 예: mn=1, mx=5 -> 0 불가능
    // 예: mn=-5, mx=-1 -> 0 불가능
    if (minEle > 0 || maxEle < 0) {
      return -1;
    }
    
    // 리프 노드면 현재 위치가 답
    if (l == r) {
      return l;
    }
    
    int mid = (l + r) ~/ 2;
    
    // **오른쪽부터 탐색** (rightmost를 찾기 위해)
    int rightNode = findRightMostZero(2 * i + 2, mid + 1, r);
    if (rightNode != -1) {
      return rightNode;
    }
    
    // 오른쪽에 없으면 왼쪽 탐색
    return findRightMostZero(2 * i + 1, l, mid);
  }
}

/// ========================================
/// MAIN SOLUTION
/// ========================================
class Solution {
  int longestBalanced(List<int> nums) {
    int n = nums.length;
    
    /// Step 1: 각 숫자의 다음 출현 위치 계산
    /// nextPos[i] = nums[i]가 i 이후에 다시 나타나는 위치
    /// 
    /// 예: [1, 2, 1, 3] -> nextPos = [2, 4, 4, 4]
    ///                      (1은 인덱스 2에 재등장, 나머지는 없음)
    Map<int, int> mp = {};
    List<int> nextPos = List.filled(n, n);
    
    for (int i = n - 1; i >= 0; i--) {
      if (mp.containsKey(nums[i])) {
        nextPos[i] = mp[nums[i]]!;
      }
      mp[nums[i]] = i;
    }
    
    /// Step 2: Prefix Sum 계산
    /// prefixSum[i] = (distinct odd 개수) - (distinct even 개수)
    /// 
    /// 예: [2, 3, 4, 5]
    /// - i=0: 2(even) 처음 등장 -> -1
    /// - i=1: 3(odd) 처음 등장 -> -1 + 1 = 0
    /// - i=2: 4(even) 처음 등장 -> 0 - 1 = -1
    /// - i=3: 5(odd) 처음 등장 -> -1 + 1 = 0
    /// prefixSum = [-1, 0, -1, 0]
    ///
    /// **Balanced의 의미**: prefixSum[j] - prefixSum[i-1] = 0
    /// 즉, prefixSum[j] = prefixSum[i-1]인 구간 [i, j]
    List<int> prefixSum = List.filled(n, 0);
    Set<int> seen = {};
    
    for (int i = 0; i < n; i++) {
      if (i > 0) {
        prefixSum[i] = prefixSum[i - 1];
      }
      
      if (seen.contains(nums[i])) {
        continue;  // 이미 본 숫자는 카운트 안 함
      }
      
      if (nums[i] % 2 == 0) {
        prefixSum[i]--;  // even
      } else {
        prefixSum[i]++;  // odd
      }
      
      seen.add(nums[i]);
    }
    
    /// Step 3: 세그먼트 트리로 최장 balanced subarray 찾기
    SegmentTree seg = SegmentTree(prefixSum);
    
    // 초기: [0, rightmost zero] 구간 체크
    int ans = seg.findRightMostZero(0, 0, n - 1) + 1;
    
    /// Step 4: Sliding window - 왼쪽 끝점을 이동하며 업데이트
    /// 
    /// 핵심 아이디어:
    /// - i번째 원소를 왼쪽 끝에서 제거 = 그 원소가 다시 나타나기 전까지
    ///   prefix 값을 복원 (even이면 +1, odd면 -1)
    /// 
    /// 예: nums = [2, 3, 2, 5], i=0에서 i=1로 이동
    /// - nums[0]=2(even)를 제거
    /// - 2가 다시 나타나는 인덱스 2 전까지 (즉, [1, 1] 구간)에 +1
    /// - 왜? 2를 "처음 본 것"으로 만들기 위해
    ///
    for (int i = 1; i < n; i++) {
      int r = nextPos[i - 1] - 1;  // 이전 원소의 재등장 전까지
      int val = (nums[i - 1] % 2 == 0) ? 1 : -1;  // even: +1, odd: -1
      
      // [i, r] 구간 업데이트
      seg.updateRangeQuery(i, r, 0, 0, n - 1, val);
      
      // 현재 i부터 시작하는 balanced subarray의 최대 길이
      int rightMostIdx = seg.findRightMostZero(0, 0, n - 1);
      if (rightMostIdx != -1) {
        ans = ans > (rightMostIdx - i + 1) ? ans : (rightMostIdx - i + 1);
      }
    }
    
    return ans;
  }
}