#!/usr/bin/env bash
# shellcheck disable=SC2317
#  PURPOSE: A qnd script to describe the mechanics of a data processing
#           scenario. This should be writen better in another language.
# -----------------------------------------------------------------------------
#  PREREQS: a) make sure directories are stubbed for in/output data.
#           b)
#           c)
# -----------------------------------------------------------------------------
#  EXECUTE:
# -----------------------------------------------------------------------------
#     TODO: 1)
#           2)
#           3)
# -----------------------------------------------------------------------------
#   AUTHOR: Todd E Thomas
# -----------------------------------------------------------------------------
#set -x


###----------------------------------------------------------------------------
### VARIABLES
###----------------------------------------------------------------------------
# ENV Stuff
#: "${1?  Wheres my first agument, bro!}"
dataBucketIn='/tmp/bucket-in'
dataBucketOut='/tmp/bucket-out'
dataSrc='./file-in.data'
dataRaw="$dataBucketIn/file-in.data"
dataProcd="$dataBucketOut/file-out.data"


# Data
declare fsStuff=(
    "$dataBucketIn"
    "$dataBucketOut"
    )


###----------------------------------------------------------------------------
### FUNCTIONS
###----------------------------------------------------------------------------
function pMsg() {
    theMessage="$1"
    printf '\n%s\n' "$theMessage"
}


###----------------------------------------------------------------------------
### MAIN PROGRAM
###----------------------------------------------------------------------------
### Pre-work: validate that everything is in place
###----------------------------------------------------------------------------
for bucket in "${fsStuff[@]}"; do
    if [[ ! -d "$bucket" ]]; then
        printf '%s\n\n' "Creating bucket: $bucket"
        mkdir -p "$bucket"
    else
        printf '%s\n\n' "The bucket exists: $bucket"
    fi
done


###---
### Copy test data to the Input Bucket
###---
pMsg "Copying test data to destination..."
cp -f "$dataSrc" "$dataRaw"
#cat "$dataRaw"


###----------------------------------------------------------------------------
### Process Data
###----------------------------------------------------------------------------
### Read the file, line by line and enrich the data
###---
### Within this block, the data can be manipulated however we like
###---
pMsg "Processing rows..."
while read -r line; do
    pMsg "  Processing $line"
    echo "${line}-enriched" >> "$dataProcd"
done < $dataRaw


###---
### Confirm results
###---
pMsg "Here's the enriched from the output file:"
cat "$dataProcd"


###---
### Clean up for retest
###---
pMsg "Cleaning the lab for another round of tests."
if ! rm -f "$dataRaw" "$dataProcd"; then
    pMsg "  The lab is still messy; please help clean."
else
    pMsg "  The lab is squeaky clean."
fi


###---
### REQ
###---


###---
### fin~
###---
exit 0
