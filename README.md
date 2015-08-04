# xor

This package provides a torch7 model that can compute xor.

## Using the pre-trained network

Install package:
```bash
deepkeep install deepkeep/xor
```

Then create a file `test.lua` and add this to it:
```lua
require 'torch'
require 'nngraph'

local net = torch.load('deepkeep/xor/network.t7')

print('0 XOR 0 = ' .. net:forward(torch.Tensor({ 0, 0 }))[1])
print('0 XOR 1 = ' .. net:forward(torch.Tensor({ 0, 1 }))[1])
print('1 XOR 0 = ' .. net:forward(torch.Tensor({ 1, 0 }))[1])
print('1 XOR 1 = ' .. net:forward(torch.Tensor({ 1, 1 }))[1])
```

Then run with
```bash
th test.lua
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
deepkeep publish
```
