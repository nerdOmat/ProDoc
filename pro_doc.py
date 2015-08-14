#! /usr/bin/python

import argparse
import os

root_dir = "pro_doc_root"
merge_dir = root_dir + "/MERGE_DOCS_SPEC"
custom_proj_dir = root_dir + "/custom_files/sphinx_proj_template"

parser = argparse.ArgumentParser(description="Install script for MAVlink.")
parser.add_argument("-i", "--init", help="Initialize project.", action="store_true")
parser.add_argument("-a", "--add", help="add project")
parser.add_argument("-d", "--delete", help="delete project")
parser.add_argument("-m", "--makeall", help="make all", action="store_true")
parser.add_argument("-o", "--openroot", help="open root", action="store_true")

args=parser.parse_args()

if args.init:
	print "Initialize."
	os.system("echo initialize")

elif args.add:
	print "Add project <" + args.add + ">"
	if os.path.isdir(args.add):
		print "Project path exists already."
	else:
		os.system("mkdir " + args.add)
		os.system("cp " + custom_proj_dir + " " + args.add + "/" + args.add.upper() + "_SPEC -R")
		#TODO: images Ordner anpassen
		os.system("cd " + merge_dir + "/included_projects && ln -s ../../../" + args.add + " . && cd ../../..")
		#TODO: Replace conf.py stuff and more
		replacements = {'ProDoc':args.add, 'PRODOC':args.add.upper()}

		with open(args.add + "/" + args.add.upper() + "_SPEC/conf.py") as infile, open(args.add + "/" + args.add.upper() + "_SPEC/conf_out.py", 'w') as outfile:
			for line in infile:
				for src, target in replacements.iteritems():
					line = line.replace(src, target)
				outfile.write(line)

elif args.delete:
	print "Delete project."
	os.system("rm " + args.delete + " -R")
	os.system("rm " + merge_dir + "/included_projects/" + args.delete)

elif args.makeall:
	print "Make all."
	os.system("cd pro_doc_root/MERGE_DOCS_SPEC/ && sudo make bibsphinx && cd ../..")

elif args.openroot:
	print "Open root."
	os.system("gnome-open pro_doc_root/MERGE_DOCS_SPEC/_build/latex/MERGE_DOCS_REV_A_SPEC.pdf")

else:
	print "Publish ...\n\n"
