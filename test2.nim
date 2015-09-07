import sequtils
import times

proc myMap2*[T, S](data: openArray[T], op: proc (x: T): S {.closure.}): seq[S] {.inline.}=
  newSeq(result, data.len)
  for i in 0..data.len-1: result[i] = op(data[i])

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test2: reimplement system.nim's map() here with {.inline.}, and call that"
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
