#!/bin/bash

# Prompt the user to enter a day
echo "Enter a day of the week (e.g., Monday, Tuesday, etc.):"
read day

# Convert the input to lowercase for case-insensitive comparison
day=$(echo "$day" | tr '[:upper:]' '[:lower:]')

# Determine the class time and room information
case $day in
    monday)
        echo "DOS class is at 10:00 AM in Room 101."
        ;;
    tuesday)
        echo "DOS class is at 2:00 PM in Room 202."
        ;;
    wednesday)
        echo "DOS class is at 11:00 AM in Room 303."
        ;;
    thursday)
        echo "DOS class is at 3:00 PM in Room 404."
        ;;
    friday)
        echo "DOS class is at 1:00 PM in Room 505."
        ;;
    saturday)
        echo "No class on Saturday."
        ;;
    sunday)
        echo "Holiday"
        ;;
    *)
        echo "Invalid day entered. Please enter a valid day of the week."
        ;;
esac

