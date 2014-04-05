#!/bin/bash
latexmk -pdf -auxdir=out -outdir=out var/full
latexmk -pdf -auxdir=out -outdir=out var/twosided
latexmk -pdf -auxdir=out -outdir=out var/abstract
latexmk -pdf -auxdir=out -outdir=out var/approx-lin
latexmk -pdf -auxdir=out -outdir=out var/docu
shopt -s extglob
rm out/*.!(pdf)
