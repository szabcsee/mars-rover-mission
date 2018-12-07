
#NASA Mars Rover mission

  1. Run 
  2. Implementation
  3. Description (refer to DESCRIPTION.md)


## Run

### Setup
Install bundle dependencies
```
$ bundle install
```
---

### Running Tasks

Run `mars_rover.rb` script with `mars_rover.input`
```
$ rake run
```

<br />

Run Rspec test files
```
$ rake test
```

##Implementation

I have refactored and extended the original solution as you asked for it.
The Directions became a module with classes for each directions.

I have created a missionControl class that handles the rover and the plateau. 
The Rover class only responsible for directions and moving and the Plateau contains
the coordinates information and check the position against its boundaries.

I have removed the infinite plateau option if the rover reaches the edge of the plateau 
actually that missionControl checks and stops to respond to inputs that would drive the rover
to its death. 

There could be still validation implemented for the input lines and mission control could be
improved to contain more rovers running on it etc. 

There tests for all classes and tried to cover all scenarios.