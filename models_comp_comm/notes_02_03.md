# COMP122 Lecture Notes: Feburary 3, 2022

02/11/24
   * Feb 11, 2024
   * 02 Nov 2024
   * 2002 Nov 24

## Announcements
   1. Attendance


## Today's Agenda
   1. Additional CLI commands
   1. Snippets and not images
   1. Instruction Set Architectures

## Questions
   1. Morning: none 
   1. Afternoon: none


## Review from Last-time
   1. Models of Communication
      1. Naming (addressing): IP, MAC, 
      1. Network Flow and Levels (7)
      1. Checksum at Layer 3 to do integrity checking
   1. Transmitting information over network
      - Layer 7: data
      - Layer 4: Segments
      - Layer 3: Packets  (header & body)
      - Layer 2: Frames   (header & body)
      - Layer 1: Symbols
   1. Nomenclature of sizes: bits, bytes/octet, halfs, words, paragraphs, .. 
   1. Models of Computation
      1. Boolean Logic
      1. Finite State Machine and its path
      1. We have N machines (in order)
         - Turing Machines
           - if a problem can be solved, it can solved via turing machine
           - if a turing machine can't solve a problem, it is unsolveable
         - Linear Bounded Automata
         - Push Down Automata
         - Finite State Automata
      1. Circuts
         - Combinatorial Circuits <-> Boolean Logic
         - Sequential Circuits
           * introduce a feedback 
           * notion of time and state
           * creates latches and flip/flops
      1. Universal Computers
         1. OS and your program is located on the tape
   1. Theoritcal --> Abstract --> Physical Architectures
      - Theoritcal
        * Turing Machine --> FSA & Universal Computer
      - Abstract
        * von Neumann Architecture
        * Harvard Architecture
      - Physical 
        * MIPS 32 
        * ARM 7 & 9
        * Intel/AMD x86




---
# Today's Material
  1. Morning Session needs to pickup from Universal Computers
  1. ISA: slides

---
## Resources
   1. Endiance
      - 02/10/22  <- three pieces "02" "10" "22"
      - above is a date:
        * Feb 10, 2022
        * Oct 2, 2022 

        
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