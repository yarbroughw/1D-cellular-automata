1D-cellular-automata
====================

Processing implementation of a generator for one dimensional, n-depth cellular automata.

The program does not yet have a proper user interface - all input is provided through the global variables in the first 5 lines of CellularAutomata.pde. Here are some notes on them:

"scale" - provides the size (in pixels) of each of the cells. The number of columns and rows is then chosen as a function of this value and the overall window dimensions provided in size().

"valueDepth" - Provides the number of possible states for each cell in the automaton. "Elementary" Cellular Automata (ECA) have a value depth of 2, but this can be any arbitrary integer.

"neighborhood" - An int array containing the radii of each row in the neighborhood. ECA use a radius of 1 - one cell to the left and right of the cell in the previous time step, for a total of 3 cells. A radius of 2 would then read five cells, while a radius of 0 would cause the Automator to only read the cell's state in the previous time step. A second value in this array would mean an additional row back, for more complex computation.

"ruleNumber" - The index number for the ruleSet. The process of interpreting this value is based upon the Wolfram Codes system for ECA, but expanded out to an arbitrary value depth and neighborhood.

"randomStart" - A simple boolean for randomizing the initial rows of each CA. If false, the program will provide the value given in "valueDepth" to the center-most cell in the topmost row. Both of these modes use the number of radii in "neighborhood" as the number of rows to alter for the CA's initial state.

To save an automata to jpg, hit "s" while it renders. This will cause the automata to be saved to an image as soon as it completes the rendering process. (You'll also need to modify the filepath to fit your own directory system.)