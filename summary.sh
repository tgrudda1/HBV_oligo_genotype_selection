#!/bin/bash



# Create an output file

output_file="compiled_data.txt"



# Initialize the output file with headers

echo "File\tTotal_sequences\tReported_sequences\tReported_percentage" > "$output_file"



# Loop through the fuzznuc output files

for file in output_fuzznuc/*; do

  # Extract the Total_sequences and Reported_sequences lines

  total_sequences=$(grep "Total_sequences:" "$file" | cut -d: -f2-)

  reported_sequences=$(grep "Reported_sequences:" "$file" | cut -d: -f2-)



  # Calculate the percentage of reported sequences

  percentage=$(awk "BEGIN {printf \"%.2f\", ($reported_sequences / $total_sequences) * 100}")



  # Get the filename without the path and extension

  filename=$(basename "$file")



  # Append the data to the output file

  echo "$filename\t$total_sequences\t$reported_sequences\t$percentage" >> "$output_file"

done

