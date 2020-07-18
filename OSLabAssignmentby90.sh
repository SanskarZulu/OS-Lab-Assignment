#!/bin/bash
#Working with shell script.

#This program is about evaluating a positive integers properties user wise and storing the evaluated information.
#Author : Sanskar Sharma TY090
#PRN: 0120180381
#Script follows here


#display present working directory
pwd

# BEFORE RUNNING, GIVE EXECUTABLE PERMISSION TO THIS FILE


# 1. Go to the directory this file is in, (type : cd "CONTAINING DIRECTORY ADDRESS HERE")
# 2. In the terminal type, ( chmod 777 filemgmt.sh )

clear

read -p "Enter your directory name: " dname
#Create a directory to work in.

echo "A new directory has been created: "
mkdir -p $dname

echo "All the files in the present directory: "
ls
#check all the files in the present directory

cd $dname
#Enter your directory.

touch Data.txt
 
echo "Date & Time: "  >> Data.txt
date >> Data.txt
echo "USERNAME|NUMBER|EVEN|PRIME|FACTORIAL" >> Data.txt
#Text file to store data of different users.

declare flag=0
declare i=1

cont="y"

while [  $cont = "y" ] 
do
    read -p "Enter your name: " username
    #user details
    read -p "Enter a positive integer number:" num 
    declare temp=$num
    if [ $num -lt 0 ] 
    then
        echo "Negative numbers not allowed."
       
    elif ! [[ "$num" =~ ^[0-9]+$ ]]
    then
        echo "Alphabets, special characters and decimals not allowed."
        
    else
        echo "Entered number is: $num"
        Ev="Notchecked"
        prime="Notverified"
        fact="Notcalc."
        i="y"
        while [ $i = "y" ]
        do
        
        echo "Explore your entered number"
        echo "    1. Check Even or Odd."
        echo "    2. Check Prime or not."
        echo "    3. Find Factorial."
        echo "    4. Check all enteries."
        echo "    5. Add another entry."
        echo "    6. Exit."
 
        read -p "Enter your choice: " ch
        case $ch in

                1)       #Checking whether the number is odd or even.
                         if [ $((num%2)) -eq 0 ]
                         then
                           echo "Number is even."
                           Ev=1
                         else
                           echo "Number is odd."
                           Ev=0
                         fi
                        ;;
         		
                2)       
	        	#Bash script to find check whether a number is prime or not
	        	flg=0
	        	for ((i=2; i<=$num/2; i++))
	        	do
	        	  if [ $((num%i)) -eq 0 ]
	        	  then
	        	    echo "$num is not a prime number."
	        	    prime=0
	        	    flg=1
	        	    break
		          fi
		        done
		        if [ $flg -ne 1 ]
		        then
		           echo "$num is a prime number." 
		           prime=1
		        fi
		        ;;
		
		
	        3)       
		        #shell script for factorial of a number
		        #factorial using while loop

		        fact=1
		  
		        while [ $num -gt 1 ]
		        do
 		         fact=$((fact * num))  #fact = fact * num
 		         num=$((num - 1))      #num = num - 1
		        done

		        echo "Factorial of  $temp is: $fact"
		
		        ;;
	

	        4)       
	               
	                cat Data.txt | column -t -s "|"	
		        ;;
		

		            
	        5)       
		        break
		        ;;
		        
		6)
		        exit
                        ;;
		
		
                *)
                       echo "Invalid choice"
                       ;;
               
        esac
        read -p "Explore again? (y)" i
        done
        echo "$username|$temp|$Ev|$prime|$fact" >> Data.txt
        cat Data.txt | column -t -s "|"
    
    fi
    read -p "Try another number? (Enter y)" cont
done
echo "" >> Data.txt

exit 0
#succuessfully exited.



