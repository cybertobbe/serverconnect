#!/bin/bash

# SSH Connection Menu Script

# Define server details
declare -A servers=(
    ["1"]="Raspberry Pi:pi@192.168.0.154"
    ["2"]="Ubuntu Server:cybertobbe@192.168.0.5"
)

# Display menu
echo "SSH Connection Menu"
echo "------------------"
for key in "${!servers[@]}"; do
    # Split the value into parts
    IFS=':' read -r name connection <<< "${servers[$key]}"
    echo "$key. $name"
done
echo "q. Quit"
echo ""

# Get user input
read -p "Enter your choice (1-${#servers[@]} or q to quit): " choice

# Process choice
case $choice in
    1|2)
        # Get the connection string
        IFS=':' read -r name connection <<< "${servers[$choice]}"
        echo "Connecting to $name ($connection)..."
        ssh "$connection"
        ;;
    q|Q)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Please try again."
        exit 1
        ;;
esac
