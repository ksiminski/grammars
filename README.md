# Examples of grammars

tools: 
* ```flex``` (for extraction of tokens) and 
* ```bison``` (for context-free grammars)

## reduce-reduce-conflict

Two examples of grammars with a reduce-reduce conflict.

## reversed-polish-grammar

The reversed Polish notation produces no shift-reduce conflicts. 

## shift-reduce-conflict

An example of a grammar with a shift-reduce conflict.

## shift-reduce-conflict-associativity

A shift-reduce conflict for one token solved with token associativity.

## shift-reduce-conflict-priority

A shift-reduce conflict for two tokens solved with token priority.

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


