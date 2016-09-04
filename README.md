# matlab-str: Python-like String Manipulation Class for Matlab

## How to use
All you need to do is add `addpath('/path/to/this/repository');` in startup.m.

## Some examples
```
>> hello = str('hello');
>> world = str('world');
>> helloworld = str(' ').join({hello, world});
>> helloworld.val

ans =

hello world

>> helloworld = helloworld + '!!';
>> helloworld.val

ans =

hello world!!

>> helloworld = helloworld.replace('world', 'beautiful world');
>> helloworld.val

ans =

hello beautiful world!!

>> helloworld = helloworld.upper();
>> helloworld.val

ans =

HELLO BEAUTIFUL WORLD!!

>> len(helloworld)

ans =

    23

```
