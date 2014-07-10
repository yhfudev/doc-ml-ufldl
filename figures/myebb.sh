#!/bin/sh
# bash script to generate .bb files (instead of ebb)
#
# Author: Yunhui Fu <yhfudev@gmail.com>
# License: GPL v3.0

VERSION="myebb ver 1.0"
EXEC_AWK=$(which awk)

FN_INPUT=$1

FN_BASE=$(echo "${FN_INPUT}" | ${EXEC_AWK} -F. '{b=$1; for (i=2; i < NF; i ++) {b=b "." $(i)}; print b}')

FN_OUT="${FN_BASE}.bb"

LN=$(file "${FN_INPUT}" | awk -F, '{print $2}')
WID=$(echo $LN | awk '{print $1}')
HIG=$(echo $LN | awk '{print $3}')

cat > "${FN_OUT}" << EOF
%%Title: ${FN_INPUT}
%%Creator: ${VERSION}
%%BoundingBox: 0 0 ${WID} ${HIG}
%%CreationDate: $(date)
EOF
