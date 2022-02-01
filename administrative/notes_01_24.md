# COMP122 Lecture Notes: January 24 & 25, 2022

## Announcements

* Welcome to COMP122
* First Three Weeks

## Today's Agenda 
https://docs.google.com/presentation/d/1-Os_Mk9JoE9qQ2mYQbgEjA9WOYgkXF-GvIaFRSG160E/edit#slide=id.g10e35413a08_0_0

1. Class Material: https://github.com/COMP122/comp122-s22
  * COMP122 Home: https://github.com/COMP122
  * class-material: https://github.com/COMP122/comp122-s22.git
  * mars-mips: http://github.com/COMP122/mars-mips.git

1. Canonical Class Directory: \~/Desktop/classes/comp122
  * Syllabus:  syllabus.md
  * Schedule: class-material/administrative/schedule.pdf (subject to change)
  * Assignments: deliverables/assignments.md
    - https://github.com/COMP122/first-assignment

1. Tools

1. Context for the Class


## Questions
## Review from Last-time

---
# Today's Material



---
## Resources
## Notes
cc -E  hello_world.c > hello_world.i
hello_world.s <- cc -S hello_world.c
hello_world.o <- cc -c hello_world.o
hello_world   <- cc -o hello_world hello_world.c

cc -O # optimizes the assembly level code
cc -g # addes extra code for debugging
