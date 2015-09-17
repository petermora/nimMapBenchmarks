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

# Results with ``gcc``:
```
test0: call system.nim's map()
50024000000,4.242323875427246
test1: reimplement system.nim's map() here, and call that
50024000000,2.706707000732422
test2: reimplement system.nim's map() here with {.inline.}, and call that
50024000000,2.728699922561646
test3: map() where we iterate using it and not i
50024000000,2.694229125976562
test4: template map(), f is a function, iterating i and not it
50024000000,1.584940910339355
test5: template map(), f is an expression (e.g., it+10+i)
50024000000,2.938762903213501
test6: template map(), f is an expression (e.g., it+10+i), no type magic, hard coded types
50024000000,2.894911050796509
test7: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it
50024000000,1.637176990509033
test8: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it, no type magic
50024000000,1.649657011032104
test9: call test1's map() which is not (.inline.}
50024000000,4.332103967666626
test10: call test2's map() which is (.inline.}
50024000000,2.73048996925354
test11: call test7's map() which is a template
50024000000,1.620115041732788
test12: template map(), f is a function which is inlined by converting it to template
50024000000,1.591434001922607
```
