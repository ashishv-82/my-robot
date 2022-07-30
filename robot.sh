#!/bin/bash

check_input(){

        
        if [[ ! $1 =~ ['!@#$%^&*()_+'] ]] && [[ $1 =~ [RLFB] ]]; then
                #Return success status since the input pattern is correct.
                return
        else
                echo "The input is incorrect. Exiting..."
                exit 1;
        fi
}

calculate_distance(){

        forward_count=0
        backward_count=0

        #Set comma as delimiter
        IFS=','
 
        #Store the split steps into an array based on comma delimiter
        read -a steparr <<< "$steps"
 
        #Iterate through the array and search for Forward steps
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
 
        echo "Total forward Steps:" $forward_count
        echo "Total backward Steps:" $backward_count
        echo ""
 
        total_units=$(($forward_count - $backward_count))
        echo "Total distance in Units:" ${total_units/-/}
        echo ""
}

clear

NL=$'\n'

#Get inputs from the user
echo "Please provide steps to Mr. Robot and press ENTER."
read steps

check_input $steps

status=$?

if (exit $status); then
    echo ""
    echo "The input matches the pattern requirement. Proceeding to calculate..."
    echo ""
    
    calculate_distance
fi

 
