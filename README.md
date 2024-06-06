# HBV_oligo_genotype_selection
This is a pipeline for aligning your HBV specific oligos to genotypes A-H and all genotypes together to determine how well they may perform in application. This uses the HBVdb (https://hbvdb.lyon.inserm.fr/HBVdb/HBVdbIndex) collected genomes and fuzznuc (https://emboss.sourceforge.net/apps/cvs/emboss/apps/fuzznuc.html) to align your oligos as is or with up to 1 mismatch in the oligo sequence.

This is designed for use by HBV researchers with limited to no coding experience though is implimented in the command line.

For the first instance of use, "HBVdb_download.sh" will download all full length sequences of genotypes A-H separately and all sequences together. This only needs to be run the first time or whenever you want the most updated list of sequences, not every time. 
