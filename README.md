# model-data-processing

A model for simple/minimal data processing mechanics; this should expanded.

## The Breakdown

1. Two directories are created to emulate the buckets:
   * `/tmp/bucket-in`
   * `/tmp/bucket-out`
2. Data is dropped into the Input bucket.
3. That Data is then processed *from* the input bucket and...
4. Written to a file in the output bucket.
5. The results are displayed
6. The script cleans up after the experiment.

## The Setup

```shell
git clone git@github.com:todd-dsm/model-data-processing.git
cd model-data-processing
```

## Execution

```shell
./data-procr.sh
```

After that, the the script will print everything else you need to know.
