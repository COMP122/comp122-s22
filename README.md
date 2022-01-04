 # COMP122 Overview
#### Version: Spring 2022

This repository provides you with material associated with COMP122.  During the semester, the professor will be adding additional information to this repository. As such, you will need to regularly perform a PULL operation to obtain the most up-to-date information.

In addition to the class-material repository, you will also need to clone a number of other repositories.  Such repositories are associated with the MARS (MIPS Assembler and Runtime Simulator), as well as a repository for each of your deliverables (i.e., assignments).  All of these contents are placed within a specific file hierarchy for better organization. 

This README.md file provides you with an overview of this structure, as well as, a set of tasks to perform to get ready for this semester.  Additionally information is located within the README.md file within the administrative folder.

## Contents of prepared directory structure
  1. README.md and other standard repository files
  1. Administrative Documents
     * Class Syllabus
     * Class Schedule
  1. For each section of the course:
     * Lecture Notes
     * Lecture Slides
     * Supporting Files
  1. A Deliverable directory for all of your assignments, quizzes, and exams.
  1. A directory for the MARS program and supplementary files.


## Key Information:
  * Required
    - Personal laptop, with the following tools
    - Sublime Text (recommended editor): https://www.sublimetext.com
    - Slack (for class communication): https://slack.com 
    - Git: preinstall or https://gitforwindows.org
    - Java: preinstalled or https://www.java.com
  * Repositories
    - COMP122 Home: https://github.com/COMP122
    - class-material: https://github.com:COMP122/comp122-s22.git
    - mips: https://github.com:COMP122/mips.git
  * Canonical Class Directory: \~/classes/comp122
  * Syllabus: \~/classes/comp122/syllabus.md
  * Assignments: \~/classes/comp122/deliverables/assignments.md

## Tasks (to be complete prior to the first day of class)
  1. Establish Accounts:
     - https://slack.com: The communication tool for this class is Slack. <br/> Use your @my.csun.edu address for your account.
     - https://github.com: All deliverables are submitted via GitHub Classrooms. <br/> Pick a professional account name.

  1. Install Software on your personal computer:
     - https://www.sublimetext.com <br /> A recommended multiple purpose editor.
     - https://slack.com  <br />   You also consider installing the mobile slack application on your personal digital lifeline, aka your smart-phone.
     - https://github.com <br /> 
          - I recommend that you configure your account to authenticate using SSH.
          - Check out the [SSH Authentication Guide](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh).
          - I'll have more to say about SSH in future lectures.
 
  1. Join the Slack COMP122 work space:
     - Accept the  invitation <br/> via https://join.slack.com/t/csun-comp-122/signup using your @my.csun.edu address.
     - Add the 'fitzgerald-f22' channel, this is where all online-discussions are held.
     - Respond to the 'Hello Class' via the 'reply to thread' option (do NOT "Also send to #fitzgerald-f22").
 
  1. Setup your local comp122 environment: <br/>
      1. Create the canonical folder for the class: \~/Desktop/classes/comp122 
        ```
        mkdir -p ~/Desktop/classes/comp122
        ```
     1. Clone a copy of this repository:
        ```
        cd ~/Desktop/classes/comp122
        git clone https://github.com/COMP122/comp122-s22.git class-material
        ```
     1. Clone a copy of the mars-mips repository:
        ```
        cd ~/Desktop/classes/comp122
        git clone https://github.com/COMP122/mars-mips.git mars-mips
        ```
     1. Reposition files to be better organized:
        ```
        cd ~/Desktop/classes/comp122
        ln -s class-material/administrative/README.md README.md
        ln -s class-material/administrative/syllabus.md syllabus.md
        mkdir deliverables ; cd deliverables
        ln -s ../class-material/administrative/assignments.md assignments.md
        ```
     1. Update you current working directory
        ```
        cd \~/Desktop/classes/comp122
        ```
      Note that ``setup.bash`` can be used to automate the following steps. The file is located within the administrative folder: ``setup.bash``

  1. Consider installing docker:
     - https://www.docker.com

