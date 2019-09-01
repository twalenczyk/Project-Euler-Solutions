# Author: Taylor Walenczyk
# Last Edit: 09.01.2019
# Originally Solved: 09.01.2019
# Solution Improved: ~
# Computation time: 0.0016 seconds

import time

# Parses grid.txt
def parse_grid_file(fname):
    f = open(fname, 'r')
    txt = f.read()
    g = txt.split('\n')
    grid = [ [ int(e) for e in row.split(' ') ] for row in g[0:len(g)-1] ]
    return grid

def biggest(t1,t2,t3,t4,t5,t6):
    b = t1
    if t2 > b:
        b = t2
    if t3 > b:
        b = t3
    if t4 > b:
        b = t4
    if t5 > b:
        b = t5
    if t6 > b:
        b = t6
    return b

def largest_grid_product(grid):
    prod = 0
    for x in range(len(grid)):
        for y in range(len(grid)):
            t1 = 0
            t2 = 0
            t3 = 0
            t4 = 0
            t5 = 0
            t6 = 0

            # compute left
            if y > 2:
                t1 = grid[x][y-3]*grid[x][y-2]*grid[x][y-1]*grid[x][y]
            # compute right
            if y < len(grid)-3:
                t2 = grid[x][y]*grid[x][y+1]*grid[x][y+2]*grid[x][y+3]
            # compute down
            if x > 2:
                t3 = grid[x-3][y]*grid[x-2][y]*grid[x-1][y]*grid[x][y]
            # compute up
            if x < len(grid)-3:
                t4 = grid[x+3][y]*grid[x+2][y]*grid[x+1][y]*grid[x][y]
            # compute dag left
            if y > 2 and x < len(grid)-3:
                t5 = grid[x+3][y-3]*grid[x+2][y-2]*grid[x+1][y-1]*grid[x][y]
            # compute dag right
            if y < len(grid)-3 and x < len(grid)-3:
                t6 = grid[x+3][y+3]*grid[x+2][y+2]*grid[x+1][y+1]*grid[x][y]

            tf = biggest(t1,t2,t3,t4,t5,t6)
            if tf > prod:
                prod = tf
    return prod

if __name__ == '__main__':
    print('Hello! Enter a file name to parse.')
    fname = input()
    st = time.time()
    grid = parse_grid_file(fname)
    ft = time.time()-st
    ans = largest_grid_product(grid)
    print('The largest product in this grid is {0}'.format(ans))
    print('Solution computed in {0} seconds'.format(ft))
