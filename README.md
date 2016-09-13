# matlab-str: Python-like String Manipulation Class for Matlab

## How to use
All you need to do is add `addpath('/path/to/this/repository');` in startup.m.

## Some examples
```
>> hello = str('hello');
>> world = str('world');
>> helloworld = str(' ').join({hello, world});
>> helloworld

ans =

hello world

>> helloworld = helloworld + '!!';
>> helloworld

ans =

hello world!!

>> helloworld = helloworld.replace('world', 'beautiful world');
>> helloworld

ans =

hello beautiful world!!

>> helloworld = helloworld.upper();
>> helloworld

ans =

HELLO BEAUTIFUL WORLD!!

>> len(helloworld)

ans =

    23

>> helloworld.startswith('HELLO')

ans =

     1

>> helloworld.count('L')

ans =

     4

```
