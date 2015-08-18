#!/bin/bash
#
# git checkoutで大きくソースが変更されると
# railsのspringが原因でおかしくなる(cucumber沈黙など)ため
# checkoutのあとstopさせる

bin/spring stop
