#!/bin/bash

function checkPosition()
{
    case $Position in
	4)    newPosition=25 ;;
	7)    newPosition=22 ;;
	9)    newPosition=5  ;;
	14)   newPosition=30 ;;
	17)   newPosition=13 ;;
	21)   newPosition=3  ;;
	24)   newPosition=29 ;;
	26)   newPosition=2  ;;
	*)
	    newPosition=$Position
	    ;;
    esac
}


printf "Would you like to:\n  1)Play the game\n\n"
printf "Enter the number 1\n"
read choice
if ((choice == 1))
then
   printf " 30 29 28 27 26 25         1=start          4=Ladder to 25\n"
   printf " 24 23 22 21 20 19         7=Ladder to 22   9=snake to 5\n"
   printf " 18 17 16 15 14 13         14=Ladder to 30  17=snake to 13\n"
   printf " 12 11 10 9 8 7            21=snake to 3    24=Ladder to 29\n"
   printf " 6 5 4 3 2 1               26=snake to 2    30=End\n"

    while ((Position < 30))
    do

	echo -e "\n\nPlease press enter to roll\n\n"
	read ch

	dice=$(echo "$RANDOM%6+1" | bc)

	echo -e "\nYou have rolled a $dice.\n"

	Position=$((Position+dice))

	if (($Position > 30))
        then
	    above=$((Position-30))
	    Position=$((30-above))
	fi

	echo -e "\nYou have landed on space $Position.\n"
	checkPosition

        if ((Position < newPosition))
	then
	    echo -e "\nWell done, you have landed on a ladder. You are now on space $newPosition."
	fi

	if ((Position > newPosition))
	then
	    echo -e "\nUnlucky, you have landed on a snake. You are now on space $newPosition."
	fi

	Position=$newPosition
    done
    printf "Congratulations, you have won!"
fi

