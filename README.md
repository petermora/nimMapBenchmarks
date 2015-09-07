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
50024000000,4.304346084594727
test1: reimplement system.nim's map() here, and call that
50024000000,2.766583919525146
test2: reimplement system.nim's map() here with {.inline.}, and call that
50024000000,2.775641918182373
test3: map() where we iterate using it and not i
50024000000,2.785139799118042
test4: template map(), f is a function
50024000000,3.160981178283691
test5: template map(), f is an expression (e.g., it+10+i)
50024000000,3.000610113143921
test5: template map(), f is an expression (e.g., it+10+i), no type magic, hard coded types
50024000000,2.943650007247925
test7: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it
50024000000,2.724836111068726
test8: template map(), f is an expression (e.g., it+10+i), iterating using index i and not it, no type magic
50024000000,2.798559904098511
test9: call test1's map() which is not (.inline.}
50024000000,4.293527126312256
test10: call test2's map() which is (.inline.}
50024000000,2.735008955001831
test11: call test7's map() which is a template
50024000000,2.720563173294067
```
