---
tags [ json ]
---

# To pretty print the json:
jq "." < filename.json

# To access the value at key "foo":
jq '.foo'

# To access first list item:
jq '.[0]'

# to slice and dice:
jq '.[2:4]'
jq '.[:3]'
jq '.[-2:]'

# To reset file offset to beginning
jq 'map(if (.<key_name> | contains("<string>") ) then .offset |= 0 else . end)'
