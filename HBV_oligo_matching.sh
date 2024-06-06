mkdir -p output_fuzznuc  # create the output directory if it doesn't exist



for file in HBVdb_genomes/*.fas; do

  for oligo in oligos/*.pat; do

    output_file="output_fuzznuc/$(basename "$file")_$(basename "$oligo")"

    fuzznuc -sequence "$file" -pattern @"$oligo" -outf "$output_file"

  done

done



mkdir -p output_fuzznuc  # create the output directory if it doesn't exist



for file in HBVdb_genomes/*.fas; do

  for oligo in oligos/*.pat; do

    output_file="output_fuzznuc/$(basename "$file")_$(basename "$oligo")_1mismatch"

    fuzznuc -pmismatch 1 -sequence "$file" -pattern @"$oligo" -outf "$output_file"

  done

done

