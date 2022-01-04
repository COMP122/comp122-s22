#! /bin/bash

# A simple bash script to automate the setup of  
# COMP122: Organization Structure

TOP=~/Desktop/classes/comp122

# Create the canonical folder for the class: \~/Desktop/classes/comp122 
mkdir -p ${TOP}

# Clone a copy of this repository:
cd ${TOP}
git clone https://github.com:COMP122/comp122-s22.git class-material

# Clone a copy of the mars-mips repository:
cd ${TOP}
git clone https://github.com:COMP122/mars-mips.git mars-mips

# Reposition files to be better organized:
cd ${TOP}
ln -s class-material/administrative/README.md README.md
ln -s class-material/administrative/syllabus.md syllabus.md

mkdir deliverables ; cd deliverables
ln -s ../class-material/administrative/assignments.md assignments.md

cd ${TOP}