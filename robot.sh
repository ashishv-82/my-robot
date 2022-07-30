#!/bin/bash

#Function which validates the user input. It checks for the following:
#  User input should only contain alphabets: F, B, L, R (case insensitive).
#  Only comma is allowed. Any other special characters are to be rejected.
check_input(){

        if [[ $1 =~ ^[FfBbRrLl][0-9](,[FfBbRrLl][0-9])*$ ]]; then
                #Return success status since the input pattern is correct.
                return
        else
                echo ""
                echo "Sorry, the Robot does not understand these inputs."
                echo "Please read the instructions and execute Robot again. Exiting now."; echo ""
                exit 1;
        fi

}

#Function which calculates the distance of the Robot from its starting point.
calculate_distance(){

        forward_count=0
        backward_count=0

        #Set comma as delimiter
        IFS=','
 
        #Store the split steps into an array based on comma delimiter
        read -a steparr <<< "$steps"
 
        #Iterate through the array and search for Forward and Backward steps
        for i in "${steparr[@]}";
        do
                if grep -q "F" <<< "$i" ;
                then
                        let forward_count+=$(echo "$i" | tr -dc '0-9')
 
                elif grep -q "B" <<< "$i" ;
                then
                        let backward_count+=$(echo "$i" | tr -dc '0-9')
                else
                        :
                fi
        done
 
        #Print some statistics
        echo "The Robot has moved forward by" $forward_count "units."
        echo "The Robot has moved backwards by" $backward_count "units."
        echo ""
 
        #Find the differnece in Forward and Backward steps
        total_units=$(($forward_count - $backward_count))
        echo "The distace from the starting point is" ${total_units/-/} "units."
        echo ""
}

#Clear the screen. This program starts here.
clear

#Get inputs from the user
echo "PLEASE READ THESE INSTRUCTIONS BEFORE PROCEEDING."; echo ""
echo "This Robot is new, and understands only F, B, R, L commands to move Forward, Backwards, Right and Left."
echo "Example: R3,F2,B5,L2,F2"; echo ""
echo "The numbers are units of movement."
echo "Here, the Robot moves forward and backwards N times, turns right or left by 90 degrees N times."; echo ""
echo "Please provide instructions to Mr. Robot and press ENTER."; echo ""

#Take user inputs
read steps

#Call the check_input function
check_input $steps
status=$?

#If the user input is valid, call the calculate_disctance function
if (exit $status); then
    echo ""
    echo "Thanks You. The input matches the pattern requirements. Calculating the distance now..."
    echo ""

    #Function call
    calculate_distance
fi
