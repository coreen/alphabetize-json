Alphabetize JSON script
-----

To run, enter the following in the command line:
```
./alphabetize.rb test-input/input.json actual.json
```

Then compare the actual result vs the expected:
```
diff actual.json test-output/expected.json
```

Comparisons
 -----------------------------------------------
| Input             | Output                    |
|-------------------|---------------------------|
| input.json        | expected.json             |
| multi-level.json  | multi-level-expected.json |
 -----------------------------------------------

