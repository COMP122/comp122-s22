# COMP122 Lecture Notes: Feburary 2, 2022

## Announcements
   1. Attendance

## Today's Agenda
   1. Addtional CLI commands
   1. Snippets and not images
   1. ISA: Instruction Set Architecture

## Questions
   1. Morning: none

## Review from Last-time
   1. Models
      - OSI (theoretical model) and TCP/IP (practical)
      - Machines:  4 levels
        - T0 Language <-> Turing Machine
        - T1 Language <-> LBA Limit Bounded Automata
        - T2 Language <-> PDA Pushdown Automata
        - T3 Language <-> Finite State Machine
   1. OSI & TCP/IP layers of communication
      - 7 layers
   1. Checksum: integrity check on packets
   1. Names of stuff we send: symbols (1), frames (2), packets (3), segments (4), data (5,6,7)
   1. Machines:
      - same: all of states and a control system
      - differ:  just states, stack, bounded tape, infinite tape
   1. Universal Computer
   1. Boolean Logic / Algebra -- 
      - basics of computing using binary numbering system
      - with just 3 operators/functions/gates
        - NOT
        - AND
        - OR  

---
# Today's Material
  1. CLI update


---
## Resources
## Notes

    $ javac checksum
    $ scp checksum.java ssh.sandbox.csun.edu:
    $ script checksum.typescript      
    $ java checksum < 156.txt         
    $ pushd ~steve/comp122/checksum   
    $ time java checksum < 156.txt    
    $ time ./checksum < 156.txt       
    $ popd                            
    $ time java checksum < 156.txt    
    $ exit 