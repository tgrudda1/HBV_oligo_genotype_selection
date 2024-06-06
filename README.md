## HBV_oligo_genotype_selection
This is a pipeline for aligning your HBV specific oligos to genotypes A-H and all genotypes together to determine how well they may perform in application. This uses the HBVdb (https://hbvdb.lyon.inserm.fr/HBVdb/HBVdbIndex) collected genomes and **fuzznuc** (https://emboss.sourceforge.net/apps/cvs/emboss/apps/fuzznuc.html) to align your oligos as is or with up to 1 mismatch in the oligo sequence.

This is designed for use by HBV researchers with limited to no coding experience though is implimented in the command line.

# Process

For the first instance of use, "HBVdb_download.sh" will download all full length sequences of genotypes A-H separately and all sequences together and place them in folders within a newly created directory. This only needs to be run the first time or whenever you want the most updated list of sequences, not every time. 
To do this, run the shell script in your directory where you want everything to take place and be saved.
```
@ sh HBVdb_download.sh
```

### Oligos
Create oligo directory and enter it
```
@ mkdir oligos
@ cd oligos
```
Create a file for each oligo you want to test
```
@ vim your_oligo.pat
```
This has opened the command line text editor. To type in the editor, press the "i" button and the bottom of your window will show "-- INSERT --". Put your oligo in using typical fasta format.
```
>HBV forward primer
CCCCTAGAAGAAGAACTCCCTCGCC
```
To save your file, press the ESC key to exit INSERT mode and type
```
:x
```
Return to the directory containing your oligos directory
```
@ cd ..
```
!!! **TO ALIGN YOUR REVERSE PRIMERS, THE COMPLEMENTARY SEQUENCE OF THE REVERSE PRIMER MUST BE USED. IF YOU GET AN ERROR LATER ON SHOWING YOUR OLIGO DID NOT ALIGN TO ANY GENOTYPE, ENSURE THE OLIGO IS USING THE CORRECT STRAND (+)** !!!
### Fuzznuc
Run the shell script to align your oligos in the HBVdb sequences. This should only take a few seconds to minutes depending on how many oligos you are testing.
```
@ sh HBV_oligo_matching.sh
```
This dumps the output of **fuzznuc** into a newly created directory **output_fuzznuc**.
### Compile your results
Each fuzznuc file has the number of total sequences looked at and the number of sequences which aligned at the end of the file. Grab this data from the end of all the files in your **output_fuzznuc** directory
```
@ sh summary.sh
```
This creates a **compiled_data.txt** file with your results. 
- Column 1 "File": The set of genomes aligned to and the oligo name you chose. The suffix of "_1mismatch" indicates the same procedure -as above, but allowing for one nucleotide mismatch to occur between your oligo and the target sequence.
- Column 2 "Total_sequences": The number of full length sequences of the genotype aligned to.
- Column 3 "Reported_sequences": The number of sequences your oligo aligned to with 0 or 1 mismatch
- Column 4 "Reported_percentage": The percentage of full length HBV sequences your oligo aligned to with 0 or 1 mismatch.
