-- defining a record type
myRecord : { id : number, username : String }
myRecord = { id = 1, username = "jc" }

-- function that takes in a record and pattern matches (very similar to how Elixir does it)
userChecker : { userId : Int } -> String
userChecker { userId } =
  if userId > 10 then
    "Greater than 10"
  else
    "Less than or equal to 10"
