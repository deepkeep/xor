# xor

This package provides a torch7 model that can compute xor.

## Using the pre-trained network

Download from deepkeep:
```bash
curl -LO www.deepkeep.co/deepkeep/xor/package.zip && unzip package.zip -d xor && rm package.zip
```

```lua
local net = torch.load('xor/network.t7')

print('0 XOR 0 = ' .. net:forward(T({ 0, 0 }))[1])
print('0 XOR 1 = ' .. net:forward(T({ 0, 1 }))[1])
print('1 XOR 0 = ' .. net:forward(T({ 1, 0 }))[1])
print('1 XOR 1 = ' .. net:forward(T({ 1, 1 }))[1])
```

This will output

```
0 XOR 0 = 0.022044937504424
0 XOR 1 = 0.97297107607815
1 XOR 0 = 0.97108330450396
1 XOR 1 = 0.038300505836698
```

## Training and uploading from source

```bash
git clone https://github.com/deepkeep/xor.git
cd xor
th train.lua
# edit package.json to update version etc.
zip package.1.0.zip package.json README.md network.t7
curl -u USERNAME -F "package=@package.1.0.zip" www.deepkeep.co/api/v1/upload
```
