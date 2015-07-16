#! /usr/bin/python

import os

for files in os.listdir("."):
	if files.endswith(".pdf"):
		svgFile = open(files, 'rb')
		os.system("inkscape --without-gui --file=" + files +  " --export-plain-svg=" + os.path.splitext(files)[0] + ".svg")
