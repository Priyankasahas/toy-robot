##################################################
#Toy Robot Simulator Problem - Ruby Solution     #
#    Ruby Version:ruby 2.3.3                     #
##################################################

# Description

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

Create an application that can read in commands of the following (textual) form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.
- The application must be a command line application.

# Constraints

- The toy robot must not fall off the table during movement. This also
  includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

# Solution

# Models
   Robot
   PositionCommand

   Facing Directions:
   FacingNorth
   FacingSouth
   FacingEast
   FacingWest

# To start the application run:
    $ ruby -Ilib ./bin/robot.rb

# Application
    On the command prompt, please enter the current position of the robot on the tabletop. This should be in the following format (not case sensitive):
        Place 0,0,North
    Next, you will be prompted to enter the command. Enter any of the following commands (not case sensitive):
        MOVE
        LEFT
        RIGHT
        REPORT
    (If you mis-spell the command, do not worry. The robot will only perform action on the listed commands.)
    Once you enter REPORT, the application will output the current position and direction of the robot in the format of "0,0,NORTH"

# Tests
    The tests have been written using RSPEC. Type the following command in the command prompt to run the tests.
        $ rspec