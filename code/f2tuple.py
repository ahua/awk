#!/usr/bin/env python

import sys

l = []
for line in sys.stdin:
    l.append(line.strip().rstrip())

print tuple(l)
