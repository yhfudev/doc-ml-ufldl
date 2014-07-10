#!/bin/gnuplot
# gnuplot script for ploting the sigmoid function.
#
# Author: Yunhui Fu <yhfudev@gmail.com>
# License: GPL v3.0

set terminal png size 800,600
set output "func-sigmoid.png"

#set title 'Sigmoid Function $f(z)=\dfrac{1}{1+\exp(-z)}$'
set title 'Sigmoid Function'
set xlabel '$z$'
set ylabel '$\dfrac{1}{1+\exp(-z)}$' offset -5
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

unset key
plot [-5.1:5.1] [-0.1:1.1] sigmoid(x) title '$f(z)=\frac{1}{1+\exp(-z)}$' \
    , '< echo "0 .5"' u 1:2 w lp pt 7 ps .4 notitle \

set terminal postscript eps
set output "func-sigmoid.eps"
replot

#print GPVAL_COMPILE_OPTIONS
#print GPVAL_TERMINALS
##set terminal pdf monochrome solid font 'Helvetica,14' size 16cm,12cm
#set terminal pdf
#set output "${PARAM_FN_OUTBASE}.pdf"

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
set terminal latex size 3.3in,3in
set output "func-sigmoid.tex"
replot

## set back to default
set output
set terminal pop

