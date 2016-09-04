# matlab-str: Python-like String Manipulation Class for Matlab

## How to use
All you need to do is add `addpath('/path/to/this/repository');` in startup.m.

## Some examples
```
>> hello = str('hello');
>> world = str('world');
>> helloworld = str(' ').join({hello, world, '!!'});
>> helloworld.val

ans =

hello world !!

>> helloworld.upper().val

ans =

HELLO WORLD !!

>> len(helloworld)

ans =

    14

>> helloworld.replace('world', 'beautiful world')

ans =

  str with properties:

    val: 'hello beautiful world !!'

```
