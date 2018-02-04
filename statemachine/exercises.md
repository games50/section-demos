# StateMachine Demo

## Info

This demo consists of three states:

- A welcome state that simply prints a welcome message
- A bounce state where a ball bounces off the walls of the window
- A circle state where a ball is moved in a circle around the center of the screen

The 'enter' key will flip between each state.

Read through the code and experiment with changing perameters to better  
understand how it works. 

As you read, think about what improvments could be made.

- Are all variables scoped optimally? 
- Are behaviours/logic all appropriate for their classes?

Once you feel comfortable, Try adding a feature of your own.

## Exercises

- In BounceState.lua add a feature such that a new ball is added every time the  
  user hits 'space'.
- In CircleState.lua move where the ball is circling, so that it has a major
  movement pattern, like that seen in BounceState, and a minor movement pattern,
  its current circling pattern.
- Use the `State:enter()` and `State:exit()` methods to allow properties to pass
  from state to state. 
- Add a new state where a ball moves in a square movement pattern.
- Add a new sprite type inheriting from the Ball class
- Something entirely different!
