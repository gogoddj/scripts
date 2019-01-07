#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2019-01-07 18:25
# @Author  : opsonly
# @Site    : 
# @File    : test.py.py
# @Software: PyCharm

import re
s = re.compile(r'hostfix/*')

if s.match('hostfix/test'):
    print(1)

else:
    print(0)