# nimMapBenchmarks

Could you please run these lines and send me the result (e.g., via a pull request)? I have only ``gcc``.

Thanks, Peter
```bash
nim c -d:release test0.nim
nim c -d:release test1.nim
nim c -d:release test2.nim
nim c -d:release test3.nim
nim c -d:release test4.nim
nim c -d:release test5.nim
nim c -d:release test6.nim
nim c -d:release test7.nim
nim c -d:release test8.nim
nim c -d:release test9.nim
nim c -d:release test10.nim
nim c -d:release test11.nim
./test0
./test1
./test2
./test3
./test4
./test5
./test6
./test7
./test8
./test9
./test10
./test11
```

# Results with ``gcc``, the second numbers are in secs. I increased 1 MB ``chunkOsReturn`` to 8 MB:
```
test0: call system.nim's map()
50024000000,2.568381786346436
test1: reimplement system.nim's map() here, and call that
50024000000,0.9962680339813232
test2: reimplement system.nim's map() here with {.inline.}, and call that
50024000000,1.013481855392456
test3: map() where we iterate using it and not i
50024000000,0.9828550815582275
test4: template map(), f is a function, iterating i and not it
50024000000,0.9950881004333496
test5: template map(), f is an expression (e.g., it+10+i)
50024000000,1.203803062438965
test6: template map(), f is an expression (e.g., it+10+i), no type magic, hard coded types
50024000000,1.187149047851562
test7: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it
50024000000,0.9857718944549561
test8: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it, no type magic
50024000000,0.981799840927124
test9: call test1's map() which is not (.inline.}
50024000000,2.530776023864746
test10: call test2's map() which is (.inline.}
50024000000,0.9862339496612549
test11: call test7's map() which is a template
50024000000,0.9953229427337646
test12: template map(), f is a function which is inlined by converting it to template
50024000000,1.017182111740112
```
