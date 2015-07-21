# xor

This package provides a torch7 model that can compute xor.

## Usage

```lua
local net = torch.load('xor/trained-network.t7')

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
