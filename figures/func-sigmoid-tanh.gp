#!/bin/gnuplot
# gnuplot script for ploting the tanh and sigmoid functions.
#
# Author: Yunhui Fu <yhfudev@gmail.com>
# License: GPL v3.0

set terminal png size 800,600
set output "func-sigmoid-tanh.png"

#set title 'Sigmoid Function'
set xlabel '$z$'
set ylabel '$f(z)$' offset -1
set grid x y
set grid lt 3 ls 4
#unset key
set key box
set key right bottom
set key spacing 4

a=1.0
b=1.0
c=1.0
sigmoid(x)=c/(1.0 + b * exp(-a * x))
#mytanh(z)=(exp(z) - exp(-z)) / (exp(z) + exp(-z))

fline1(x)=0
fline2(x)=1
fline3(y)=0.5
fline4(y)=-1
#plot [-5.1:5.1] [-1.1:1.1] sigmoid(x) title '$\dfrac{1}{1+\exp(-z)}$', tanh(x) title '$\tanh(z)$' ls 4 \
#    , fline1(x) notitle ls 2 \
#    , fline2(x) notitle ls 2 \
#    , fline3(x) notitle ls 2 \
#    , fline4(x) notitle ls 2 \
#    , '< echo -e "0 -1.1"' w impulse ls 2, '< echo "0 1.1"' w impulse ls 2

#plot [-5.1:5.1] [-1.1:1.1] sigmoid(x) title '$\dfrac{1}{1+\exp(-z)}$', tanh(x) title '$\tanh(z)$' ls 4 \
#    , '< echo -e "0 0\\n0 0.5\\n"' u 1:2:(0):1 w xerror ps 0 lt 0 lw 0.5 lc rgb "#ff0000" notitle, '' u 1:2 w i lt 0 lw 0.5 lc rgb "#ff0000" notitle, '' u 1:2 w lp pt 7 ps 1.5 notitle

plot [-5.1:5.1] [-1.1:1.1] sigmoid(x) title '$\frac{1}{1+\exp(-z)}$', tanh(x) title '$\tanh(z)$' ls 3 lt 3 \
    , '< echo "0 0"' u 1:2 w lp pt 7 ps .4 notitle \
    , '< echo "0 .5"' u 1:2 w lp pt 7 ps .4 notitle \

set terminal postscript eps
set output "func-sigmoid-tanh.eps"
replot

#print GPVAL_COMPILE_OPTIONS
#print GPVAL_TERMINALS
##set terminal pdf monochrome solid font 'Helvetica,14' size 16cm,12cm
#set terminal pdf
#set output "${PARAM_FN_OUTBASE}.pdf"
set terminal pdf
set output "func-sigmoid-tanh.pdf"
replot

#set terminal postscript eps
#set output "| epstopdf --filter --outfile=${PARAM_FN_OUTBASE}.pdf"

#set terminal postscript enhanced color
#set output "| ps2pdf - ${PARAM_FN_OUTBASE}.pdf"

## in latex main file:
##\begin{figure}
##  \begin{center}
##    \input{plot}
##  \end{center}
##\end{figure}
#set terminal latex
## default size 5x3 in.
#set terminal latex size 7cm, 5cm
#set output "${PARAM_FN_OUTBASE}.tex"
#replot
set terminal latex
#set terminal latex size 5in,3in
set output "func-sigmoid-tanh.tex"
replot

## set back to default
set output
set terminal pop

