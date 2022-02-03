# COMP122 Lecture Notes: Feburary 3, 2022

## Announcements
   1. Attendance


## Today's Agenda
   1. Additional CLI commands
   1. Snippets and not images
   1. Instruction Set Architectures

## Questions
   1. Morning: none 


## Review from Last-time
   1. Models of Communication
      1. Naming (addressing): IP, MAC, 
      1. Network Flow and Levels (7)
      1. Checksum at Layer 3 to do integrety checking
   1. Models of Computation
      1. Boolean Logic
      1. Finite State Machine and its path
      1. We have N machines (in order)
         - Turing Machines
         - Linear Bounded Automata
         - Push Down Automata
         - Finite State Automata
      1. Circuts
         - Combinatorial Circuits <-> Boolean Logic
         - Sequetial Circuits
           * notion of time and state
           * creates latches and flip/flops
      1. Universal Computers



---
# Today's Material
  1. Morning Session needs to pickup from Universal Computers
  1. ISA: slides

---
## Resources
## Notes

    $ javac checksum
    $ scp checksum.java ssh.sandbox.csun.edu:
    $ script checksum.typescript      
    $     java checksum < 156.txt         
    $     pushd ~steve/comp122/checksum   
    $     time java checksum < 156.txt    
    $     time ./checksum < 156.txt       
    $     popd                            
    $     time java checksum < 156.txt    
    $ exit 