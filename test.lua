require 'torch'
require 'nn'
require 'nngraph'

local T = torch.Tensor
local net = torch.load('trained-network.t7')

print('0 XOR 0 = ' .. net:forward(T({ 0, 0 }))[1])
print('0 XOR 1 = ' .. net:forward(T({ 0, 1 }))[1])
print('1 XOR 0 = ' .. net:forward(T({ 1, 0 }))[1])
print('1 XOR 1 = ' .. net:forward(T({ 1, 1 }))[1])
