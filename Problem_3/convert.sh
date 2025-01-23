#!/bin/bash

# Function to convert decimal to hexadecimal
decimal_to_hex() {
    decimal=$1
    hex=""
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 16))
        case $remainder in
            10) hex="A$hex" ;;
            11) hex="B$hex" ;;
            12) hex="C$hex" ;;
            13) hex="D$hex" ;;
            14) hex="E$hex" ;;
            15) hex="F$hex" ;;
            *) hex="$remainder$hex" ;;
        esac
        decimal=$((decimal / 16))
    done
    echo "$hex"
}

# Function to convert decimal to binary
decimal_to_bin() {
    decimal=$1
    binary=""
    while [ $decimal -gt 0 ]; do
        remainder=$((decimal % 2))
        binary="$remainder$binary"
        decimal=$((decimal / 2))
    done
    echo "$binary"
}

# Main logic
echo "Enter a decimal number :"
read decimal_input

# Validate input
if ! [[ "$decimal_input" =~ ^[0-9]+$ ]] || [ "$decimal_input" -ge 100000 ]; then
    echo "Decimal number should be less than 100000."
    exit 1
fi

# Convert decimal to hexadecimal and binary
hexadecimal=$(decimal_to_hex $decimal_input)
binary=$(decimal_to_bin $decimal_input)

# Output the results to a text file "convertion result.txt" in /Problem3
output_file="conversion_results.txt"

# Results
echo "Decimal: $decimal_input" > $output_file
echo "Hexadecimal: $hexadecimal" >> $output_file
echo "Binary: $binary" >> $output_file

echo "View results in conversion_results.txt!"