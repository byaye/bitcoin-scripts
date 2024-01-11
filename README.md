# Bitcoin Scripts

This is a personal project to play around with bitcoin-cli. I'll be adding new scripts soon. The scripts are located in the `scripts` folder.

## Scripts

### empty-blocks.sh

This script checks for empty blocks within a specified range in the Bitcoin blockchain using the Bitcoin CLI. An empty block is defined as a block with only one transaction (the coinbase transaction).

Usage:
bash
```
./empty-blocks.sh <start_block> <end_block>
```
<start_block>: The starting block number (inclusive).
<end_block>: The ending block number (inclusive).
Example:
To check for empty blocks in the range of blocks 685207 to 685209, run:
```
./empty-blocks.sh 685207 685209
```
Arguments Validation:
The script validates that exactly two command-line arguments are provided and that the start block is less than or equal to the end block. If the validation fails, the script displays a usage message and exits with an error code.

## Dependencies:
jq: JSON processor for parsing Bitcoin CLI output.
bitcoin-cli and a bitcoin node.

## Notes:
Ensure that the Bitcoin node is running and accessible.
Adjust the script according to your specific Bitcoin node setup.
