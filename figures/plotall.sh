#!/bin/sh
# bash script to plot all figures
#
# Author: Yunhui Fu <yhfudev@gmail.com>
# License: GPL v3.0

EXEC_AWK=$(which awk)
EXEC_PLOT=$(which gnuplot)

FN_INPUT=$1

FN_BASE=$(echo "${FN_INPUT}" | ${EXEC_AWK} -F. '{b=$1; for (i=2; i < NF; i ++) {b=b "." $(i)}; print b}')

${EXEC_PLOT} func-sigmoid.gp
${EXEC_PLOT} func-tanh.gp

${EXEC_PLOT} func-sigmoid-tanh.gp

# find . -name "*.png" | xargs -n 1 ./myebb.sh

