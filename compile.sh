#!/bin/bash
latexmk -pdf -auxdir=out -outdir=out var/full
shopt -s extglob
rm out/*.!(pdf)
