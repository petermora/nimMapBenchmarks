import sequtils
import times
import macros
import future

macro tryToMakeTemplate(id: expr, f: expr): expr =
  var f = f
  #if f.kind == nnkInfix and f.len > 2 and $(f[0]) == "=>":
  #  f = arrowLambdaImpl(f[1], f[2])
  if f.kind == nnkLambda:
    result = newNimNode(nnkTemplateDef).add(
      newIdentNode($id))
    for i in 1..<f.len:
      result.add(f[i])
  else:
    result = parseExpr("var " & $id & "{.gensym.} = " & $f)
    echo "AAA"
    echo treeRepr(result)

template myMap12[T,U](seq1: seq[T], f: expr): seq[U] =
  tryToMakeTemplate(templateF, f)
  var result = newSeq[type(templateF(seq1[0]))](seq1.len)
  for i in 0..<seq1.len:
    result[i] = templateF(seq1[i])
  result

when isMainModule:
  var x = toSeq(1..1000)
  var s = 0
  echo "test12: template map(), f is a function which is inlined by converting it to template"
  var t = epochTime()
  for i in 0..<100_000:
    s += myMap12(x, proc(a: int): int = a+10+i)[9]
    s += myMap12(x, proc(a: int): int = a+11+i)[9]
    s += myMap12(x, proc(a: int): int = a+12+i)[9]
    s += myMap12(x, proc(a: int): int = a+13+i)[9]
    s += myMap12(x, proc(a: int): int = a+14+i)[9]
    s += myMap12(x, proc(a: int): int = a+15+i)[9]
    s += myMap12(x, proc(a: int): int = a+16+i)[9]
    s += myMap12(x, proc(a: int): int = a+17+i)[9]
    s += myMap12(x, proc(a: int): int = a+18+i)[9]
    s += myMap12(x, proc(a: int): int = a+19+i)[9]
  echo s, ",",epochTime()-t
