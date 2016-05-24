# rpncalculator

### To Run:
  From the top directory run:
  `ruby rpn.rb`
  
  The RPN Calculator, expects the full equation to be entered on one line.  When the user presses enter,
  the calculation is performed.
  
  To quit, enter 'q', Ctrl+C, or Ctrl+D
  
### To Run Tests:
   From the top directory run:
   `rspec`
   

### Design Decisions

  * Used a REPL type CLI for usability.  The user will be able to enter the full equation and press enter for calculation.
  * RPNCalculator and CLI are their own classes/modules for readablity and testability.
  * Used the "send" method to run the calculations to allow for any available operators.  
    If it is an invalid operator, the expection is caught.
