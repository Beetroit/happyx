import ../src/happyx
import std/asyncjs

let htmlProcs = thunkHtmls:
  html:
    tSpan: "front"
  html:
    tSpan: "back"

let htmlTags = buildHtmls:
  html:
    tSpan: "right"
  html:
    tSpan: "left"


htmlTags[1].eventListener("click"):
  echo 1
htmlTags[1].click()

let promise = withPromise res:
  withTimeout 1000, t:
    clearTimeout(t)
    echo "timeout"
    {.emit: "res(true)".}


component FormatProcHtml:
  p: (proc (): TagRef) # parentheses needed in avoid "nested statements" error
  html:
    em(style="color:blue"):
      {self.p()}

component FormatTagHtml:
  t: TagRef
  html:
    em(style="color:blue"):
      {self.t.val}


proc testAsync() {.async.} =
  echo "Hello"


component PlainDiv:
  html:
    tDiv:
      slot


var counter: int = 0
proc nextCount(): int =
  counter += 1
  result = counter

component ShowNextCount:
  count: int = nextCount()
  html:
    {self.count}
    " "
    {self.uniqCompId}

proc countFactory(): TagRef = buildHtml:
  {nextCount()}

proc countComponentFactory(): TagRef = buildHtml:
  ShowNextCount


appRoutes("app"):
  "/":
    for i in 1..5:
      tDiv:
        {$htmlProcs[0]()}
        @click:
          discard await sleepAsyncJs(500)
          discard await testAsync()
      FormatProcHtml(htmlProcs[1])
    for i in 1..5:
      tDiv:{$htmlTags[0]}
      FormatTagHtml(htmlTags[1])
  "/issues/304":
    "in a div"
    tDiv:
      tDiv(class="no-print", id="trial1"):
        "hello"
      tDiv(id="trial2", class="no-print"):
        "hello again"
      tDiv(id="trial2", class="no-print", style="color: red"):
        "hello again"
    "in a component slot that goes into a div"
    PlainDiv():
      tDiv(class="no-print", id="trial1"):
        "hello"
      tDiv(id="trial2", class="no-print"):
        "hello again"
      tDiv(id="trial2", class="no-print", style="color: red"):
        "hello again"
  "/issues/303":
    "counts as thunks:"
    for i in 1..5:
      tDiv: countFactory()
    "counts as components in thunks:"
    nim: counter = 0
    for i in 1..5:
      for j in 1..2:
        tDiv: countComponentFactory()
    "counts with just the components"
    nim: counter = 0
    for i in 1..5:
      tDiv: ShowNextCount
