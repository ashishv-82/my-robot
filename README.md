# The Robot

This is a simple program which receives commands in order to move a robot, and finally calculates the distance of the robot from the starting point.

## Description

The robot receives commands from the user to move. These commands will tell the robot to move forwards or backwards, and turn left or right. The commands will be in the format <command><number>.
  
  For example 'L1' means 'turnn left by 90 degrees once', 'B2' would mean go backwards by 2 units.
  
  ### Available commands
  
  * `F` - Move forward 1 unit
  * `B` - Move backward 1 unit
  * `R` - Turn right 90 degrees
  * `L` - Turn left 90 degrees
  
  ### Valid inputs
  
  ```bash
  R2,F1,B7,L3,F1
  b2,F6,r2,L10
  ```
  
  ### Incorrect inputs
  
  ```bash
  X3,R6,L3,F3
  F4,L9,B1,S1,F1
  ```
  
## Getting Started
