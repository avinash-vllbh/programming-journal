This directory contains the source code for the coding exercise given as part of ZillowSDECodingTest

StringToLong.java
------------------
Application prompts for a string to be entered in command line and converts it to long number.
Application can be run by following below two steps

1. Run javac StringToLong.java from command line to build the class file.

2. Invoke the application from command line using below command
    java StringToLong

Displays the result for test() method given in the coding exercise

Also, gives two options to the user:
If option 1 - Test new string is selected, prompts the user to enter a new string and returns the coverted value of string to long.
If option 2 - Exit is selected application terminates execution.

TrinaryTree.java
------------------
Application prompts options to do basic operations like insert, delete and print operations on a trinary tree.
Application can be run by following below two steps

1. Run javac TrinaryTree.java from command line to build the class file.

2. Invoke the application from command line using below command
    java TrinaryTree

Gives four options to the user:
If option 1 - Insert is selected, prompts the user to enter a new node to be inserted to the tree.
If option 2 - Delete is selected, prompts the user to enter a node that needs to be deleted from the tree.
If options 3 - Print is selected, prints the current tree in a pre-order traversal.
If option 4 - Exit is selected, exits the application.

ZillowCodingExerciseTests.java
--------------------------------
Unit tests for both StringToLong and TrinaryTree applications.
Test cases can be run by following below steps

1. Run javac -cp junit-4.10.jar *.java from command line to build the class file for all the java files in the project.

2. Invoke test cases from command line uing below command
    java -cp junit-4.10.jar:. org.junit.runner.JUnitCore ZillowCodingExerciseTests

Shows test results.
