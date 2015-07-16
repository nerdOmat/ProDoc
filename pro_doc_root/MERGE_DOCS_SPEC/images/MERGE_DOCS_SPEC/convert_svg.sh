#!/bin/bash

echo Convert all pdf files to scaled svg files
#for i in *.pdf; do inkscape --without-gui --file=$i --export-plain-svg=temp.svg; rsvg-convert temp.svg -z 1.2 -a -f svg -o $i.svg; echo $i; done
for i in *.pdf; do inkscape --without-gui --file=$i --export-plain-svg=$i.svg; echo $i; done
#for i in *.pdf; do inkscape --without-gui --file=$i --export-png=$i.png; echo $i; done
