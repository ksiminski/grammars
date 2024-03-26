# Examples for grammars

tools: 
* flex (for extraction of tokens) and 
* bison (for grammars)

## reduce-reduce-conflict

## reversed-polish-grammar

## shift-reduce-conflict

## shift-reduce-conflict-associativity

## shift-reduce-conflict-priority

## sum-of-ones


Example of a grammar for the regular language:

```L = { 1^n 0 1^m 0 1^(n+m) }```

There are three blocks of 1's separated by single 0's. 
The number of 1's in the third block is the sum of numbers of 1's 
in the first and second block.

examples of words of the language: 
```101011```
```11010111```
```1111011101111111```
```0101```

In each run only a single word is tested.


