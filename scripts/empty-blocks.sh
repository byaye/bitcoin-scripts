#!/bin/bash

# Check if exactly two command-line arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_block> <end_block>"
    exit 1
fi

# Extract start and end block values from command-line arguments
start_block=$1
end_block=$2

# Validate that start_block is less than or equal to end_block
if [ "$start_block" -gt "$end_block" ]; then
    echo "Error: Start block must be less than or equal to end block."
    exit 1
fi

# Initialize a variable to count empty blocks
result=0

# Loop through the specified block range
for i in $(seq "$start_block" "$end_block"); do
    # Get the block hash for the current block
    blockhash=$(bitcoin-cli getblockhash $i)

    # Get block information for the current block
    blockinfo=$(bitcoin-cli getblock $blockhash)

    # Print the current block number
    echo "Checking block: $i..."

    # Extract the number of transactions in the block
    txs=$(echo "$blockinfo" | jq -r '.tx | length')

    # Check if the block has only one transaction (empty block)
    if [ "$txs" -eq 1 ]; then
        ((result++))
        echo "  This block is empty! (only the coinbase transaction is present)"
    else
        echo "  This block is not empty. $txs transactions were included"
    fi
    echo "So far I found $result empty blocks..."
done

# Print the final result
echo ------------------
echo "Number of empty blocks in the specified range: $result"

