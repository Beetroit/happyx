import ../src/happyx
import json


# type MyType = object
#   field: int

# proc `$`*(self: MyType): string =
#   "MyType(a = " & $self.field & ")"

# var
#   data = remember @[1, 2, 3]
#   dataArr = remember [1, 2, 3]
#   setData = remember {2, 4, 8, 16, 128}
#   myType = remember MyType(field: 100)
#   jsonVar = remember %*{"a": 1, "b": 2, "c": 3}
#   table = remember newTable[string, string]()
#   tableStr = remember newStringTable()

# echo myType->field
# echo typeof(jsonVar.val)

# discard data->pop()
# data->add(1)
# data->insert(100, 0)

# setData->incl(32)
# setData->excl(4)

# echo data
# echo setData
# echo jsonVar

# data[0] = 0
# dataArr[0] = 0
# table["Hello"] = "World"
# tableStr["Hello"] = "World"

# echo data
# echo dataArr
# echo table
# echo tableStr

# for i in data->items():
#   echo i
