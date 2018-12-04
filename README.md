
#NASA Mars Rover mission

  1. Description
  2. Implementation

##Description
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. A rover’s position and location is represented by a combination of x and y co- ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

 

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same Heading. Assume that the square directly North from (x, y) is (x, y+1).

###INPUT:

The first line of input is the upper-right coordinates of the plateau, the lower- left coordinates are assumed to be 0,0. The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation. Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

###OUTPUT

The output for each rover should be its final co-ordinates and heading.

 

####INPUT AND OUTPUT:

__Test Input:__

5 5

1 2 N

L M L M L M L M M

3 3 E

M M R M M R M R R M

 

__Expected Output:__

1 3 N

5 1 E

##Implementation

__clone repo__

__bundle install__

_for testing:_
__run rspec__

_launch:_ __ruby src/mars_rover_problem.rb mission.txt__

Rover tests:

initial test for testing control

- First and second test case for testing movement in all directions
- Third and fourth test case crossing the plateau on all sides
- Fifth test case runs on an increased plateau

_The plateau has been implemented that once the rover goes over its boundaries it will appear on the opposite side._