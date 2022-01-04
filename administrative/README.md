# COMP122: Organizational Structure[^1] 
[^1]: This file is to be repositioned at the root of the COMP122 file structure.

This file describes the organization of the COMP122 file system.  Students need to perform a number of tasks during the semester to ensure they have the most up-to-date material and they have completed and submitted all assignments.

This file:
  1. enumerates the high-level tasks that a student must perform during the semester
  1. provides an overview of the file structure used to organize all class material


### Tasks:
  1. Pull from the class-material repository on a daily basis
     ```
     cd \~/Desktop/classes/comp122/class-material
     git pull origin main
     ```
  1. Pull from the mars-mips repo as necessary
     ```
     cd \~/Desktop/classes/comp122/mars-mips
     git pull origin main
     ```
  1. Complete various assignments, quizzes, and tests
     * Review: \~/Desktop/classes/comp122/deliverables/assignments.md
     * Assignments:
       - must be placed within \~/Desktop/classes/comp122/deliverables
       - must be "pushed" to github
     * Read: each assignment contains a README.md file with instructions

### Canonical Root: \~/Desktop/classes/comp122
  - README.md (symbolic link to the administrative/README.md)
  - syllabus.md (symbolic link to the syllabus.md)
  - deliverables (a directory for the placement of all deliverables)
    - assignment.md (symbolic link to assignments.md)
    - 11-\<assignment\>-\<account\> (Section #1, Assignment #1)
    - 24-\<assignment\>-\<account\> (Section #2, Assignment #4)
    - ...
    - 40-\<assignment\>-\<account\> (Section #4, Assignment #0)

  - class-material/ (https://github.com/COMP122/comp122-s22.git)
    - administrative/ (files associated the administration of the class)
      - README.md
      - assignments.md
      - syllabus.md
      - schedule.pdf
      - setup.bash (bash script to automate the setup process)
    - resources/ (files related to auxiliary information)
    - models_comp_comm/
      - documents/ (supporting documents for this section)
      - mm_dd_lecture.md (lecture notes for MM/DD/2022)
    - format_encodings/
      - documents/ (supporting documents for this section)
      - mm_dd_lecture.md (lecture notes for MM/DD/2022)
    - digital_logic/
      - documents/ (supporting documents for this section)
      - mm_dd_lecture.md (lecture notes for MM/DD/2022)
    - assembly/
      - documents/ (supporting documents for this section)
      - mm_dd_lecture.md (lecture notes for MM/DD/2022)

  - mars-mips: (https://github.com/COMP122/mars-mips.git)
    - README.md
    - mars/ (information about MARS (MIPS Assembler and Runtime Simulator))
    - macros/ (a set of macros for illustrative purposes)
    - pseudo/ (a set of pseudo instructions for illustrative purpose)
    - programs/ (a set of MIPS programs for illustrative purpose)


