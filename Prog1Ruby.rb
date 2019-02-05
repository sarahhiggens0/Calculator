# This is the main for Prog1.
# It invokes the run method of a Vectorator instance

require_relative 'Vectorator'

#If you want to read from a file for testing, uncomment this and put a p1.in
# file in the lib folder of your project (with your source files).
# This redirects Standard Input to come from a file.
# Be sure to comment it out when you submit to the GRADER.
#$stdin.reopen("Prog1_1.in")

# Make a Vectorator instance and invoke its run method
Vectorator.new.run
