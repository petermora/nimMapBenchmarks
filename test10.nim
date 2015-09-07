import sequtils
import times
import test2

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test10: call test2's map() which is (.inline.}"
  var t = epochTime()
  for i in 0..<100_000:
    s += myMap2(x, proc(x: int): int = x+10+i)[9]
    s += myMap2(x, proc(x: int): int = x+11+i)[9]
    s += myMap2(x, proc(x: int): int = x+12+i)[9]
    s += myMap2(x, proc(x: int): int = x+13+i)[9]
    s += myMap2(x, proc(x: int): int = x+14+i)[9]
    s += myMap2(x, proc(x: int): int = x+15+i)[9]
    s += myMap2(x, proc(x: int): int = x+16+i)[9]
    s += myMap2(x, proc(x: int): int = x+17+i)[9]
    s += myMap2(x, proc(x: int): int = x+18+i)[9]
    s += myMap2(x, proc(x: int): int = x+19+i)[9]
  echo s, ",",epochTime()-t
