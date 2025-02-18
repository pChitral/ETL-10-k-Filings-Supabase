#!/bin/bash -l
#
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --mem=50000
#SBATCH --job-name="ETL_EDGAR_10k_filings"
#SBATCH --output=ETL_EDGAR_10k_filings.out
#SBATCH --mail-user=chitralp@buffalo.edu
#SBATCH --mail-type=end
#SBATCH --partition=general-compute
#SBATCH --qos=general-compute
#SBATCH --cluster=ub-hpc
# Navigate to the directory where you want to run the Python script
cd /user/chitralp/ETL-10-k-Filings

# Activate your Python virtual environment
source venv/bin/activate

# Run your Python script and use 'tee' for streaming the output
python3 scrape_entire_text_mda.py | tee ETL_SEC_EDGAR_10k_filings_stream.out
