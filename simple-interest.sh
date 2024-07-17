
#!/bin/bash

# Function to calculate simple interest
calculate_simple_interest() {
  principal=$1
  rate=$2
  time=$3

  # Calculate simple interest
  interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

  # Display the result
  echo "Principal Amount: $principal"
  echo "Annual Interest Rate: $rate%"
  echo "Time Period: $time years"
  echo "Simple Interest: $interest"
}

# Main script execution
echo "Simple Interest Calculator"
echo "--------------------------"

# Read the principal amount
read -p "Enter the principal amount: " principal

# Read the annual interest rate
read -p "Enter the annual interest rate (in %): " rate

# Read the time period in years
read -p "Enter the time period (in years): " time

# Validate inputs
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
  echo "Error: All input fields are required."
  exit 1
fi

if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Principal amount must be a positive number."
  exit 1
fi

if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Interest rate must be a positive number."
  exit 1
fi

if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Time period must be a positive number."
  exit 1
fi

# Calculate and display simple interest
calculate_simple_interest $principal $rate $time
