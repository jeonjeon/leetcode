class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        neg = (dividend < 0) != (divisor < 0)
        dividend = abs(dividend)
        divisor = abs(divisor)
        bin = 1
        res = 0
        while dividend >= bin * divisor:
            bin <<= 1
        while dividend >= divisor:
            bin >>= 1
            if bin * divisor <= dividend:
                dividend -= bin * divisor
                res += bin
        if neg:
            return max(-2147483648, res * -1)
        else:
            return min(2147483647, res)

        