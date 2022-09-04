# Features
- Possible to Encode and also Decode data using the xor algorithm
- Support all string-based data to xor that (also for files can use file base64 to do xor on it this will be up to you how to do that)
- Standalone it doesn't use any function from anywhere
- Optimize and get low usage (0.00 and max 0.01 on working)
- Clean coding

# Simple Xor Explain
![image](https://ganlvtech.github.io/lua-simple-encrypt/images/xor.gif)

# Resource preview
##### Script Tested
![image](https://cdn.discordapp.com/attachments/555420890444070912/1015975135825629215/unknown.png)
##### Other Tools Tested
![image](https://cdn.discordapp.com/attachments/555420890444070912/1015975304247906324/unknown.png?size=4096)
<details>
  <summary>More info</summary>

  ### Example Code
  ```lua
    local key = "BZY"
    local enc,enc2 = XOR_Ecode("My Name Is BaziForYou",key)
    print(json.encode(enc))
    print(enc2)
    local Dec,Dec2 = XOR_Decode(enc,key)
    print(json.encode(Dec))
    print(Dec2)
    local Dec3,Dec4 = XOR_Decode(enc2,key)
    print(json.encode(Dec3))
    print(Dec4)
  ```
  ### Used Data
  Target Text: ``My Name Is BaziForYou``
  Target Key: ``BZY``
  ### Used Tools
  - [browserling encrypt](https://www.browserling.com/tools/xor-encrypt)
  - [browserling decrypt](https://www.browserling.com/tools/xor-decrypt)
</details>

# Requirements
- Need know whats xor and how use that on your resources
- Brain

# Download & Installation
- Download https://github.com/BaziForYou/cfx-xor/archive/main.zip
- Put it in the `resources` folder 

## Installation	
##### Install as script
- Add this in your `server.cfg` in the following order:
```bash
start cfx-xor
```
##### load as share file
- add this to your resource manifest
```bash
shared_script '@cfx-xor/xor.lua'
```


## Exports	
##### Client/Server
| Export                 | Description                  | Parameter(s)                                                              | Return type      |
|------------------------|------------------------------|---------------------------------------------------------------------------|------------------|
| XOR_Ecode              | return xor encrypted data    | sentString [string],sentKey [string],customSpace [optional string]        | Table,String     |
| XOR_Decode             | return xor decrypted data    | sentData [table or string],sentKey [string],customSpace [optional string] | Table,String     |

## Example
##### Using Export
```lua
local encTable,encString = exports["cfx-xor"]:XOR_Ecode("My Name Is BaziForYou", "BZY")
local decTable,decString = exports["cfx-xor"]:XOR_Decode("0F 23 79 0C 3B 34 27 7A 10 31 7A 1B 23 20 30 04 35 2B 1B 35 2C", "BZY")
```
##### Using as shared file
```lua
local encTable,encString = XOR_Ecode("My Name Is BaziForYou", "BZY")
local decTable,decString = XOR_Decode("0F 23 79 0C 3B 34 27 7A 10 31 7A 1B 23 20 30 04 35 2B 1B 35 2C", "BZY")
```

# Credits
- [stackoverflow](https://stackoverflow.com/a/25594410/16697780)
- [gameguardian](https://gameguardian.net/forum/topic/31634-converting-decimal-to-hex/#comment-115371)
