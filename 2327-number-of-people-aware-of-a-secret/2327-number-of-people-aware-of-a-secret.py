class Solution:
    def peopleAwareOfSecret(self, n: int, delay: int, forget: int) -> int:
        arr, tot, MOD = [0] * n, 0, 1000000007
        arr[0] = 1
        for i in range(n):
            if i >= delay:
                tot += arr[i - delay]
            if i >= forget:
                tot -= arr[i - forget]
                arr[i - forget] = 0
            tot %= MOD
            arr[i] += tot
        return sum(arr) % MOD