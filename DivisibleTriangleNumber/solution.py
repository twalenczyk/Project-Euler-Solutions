# Author: Taylor Walenczyk
# Last Edit: 09.01.2019
# Originally Solved: ~
# Solution Improved: ~
# Computation time: ~

import time
import math

prime_memo = set([2])
non_prime_memo = set()

# Determines if n is prime
def is_prime(n):
    if n in prime_memo:
        return True
    if n in non_prime_memo:
        return False
    for i in range(2, int(math.ceil(math.sqrt(n)))+2):
        if n % i == 0:
            non_prime_memo.add(n)
            return False
    prime_memo.add(n)
    return True

# Yields prime numbers less than the sqrt of n
# TODO memoize
def prime_nums(n):
    for cand in range(2, int(math.ceil(math.sqrt(n)))+2):
        if is_prime(cand):
            yield cand

# Returns a dictionary s.t. k:v = prime:exp
def prime_factorization(n):
    cur = n
    ret = {}
    for i in prime_nums(n):
        is_div = cur % i == 0
        if is_div:
            ret[i] = 0
        while cur % i == 0:
            cur /= i
            ret[i] += 1
    if len(ret) == 0:
        ret[n] = 1
    return ret

# Returns the number of divisors of n
def num_divisors(n):
    nd = 1
    f = prime_factorization(n)
    for exp in f.values():
        nd *= (exp+1)
    return nd

# Yields r many triangular numbers
def tri_nums(r):
    am = 0
    for i in range(1,r+1):
        am += i
        yield am

# Returns the first triangular number with n divisors
def find_tri_num(n):
    #for tri in tri_nums(10**4):
    for i in range(1, 10**5+1):
        tri = i*(i+1)/2
        divs = num_divisors(tri)
        if divs > n:
            return tri
    return None

if __name__ == '__main__':
    print('Hello! How many divisors should the triangular number have?')
    divisors = int(input())
    st = time.time()
    ans = find_tri_num(divisors)
    #ans = prime_factorization(313112800)
    ft = time.time()-st
    print('The first triangular number with more than {0} divisors is {1}'.format(divisors, ans))
    print('Solution computed in {0} seconds'.format(ft))

