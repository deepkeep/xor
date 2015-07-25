require 'torch'
require 'nn'
require 'nngraph'

-- First let's define our network
local node_x = nn.Linear(2, 3)()
local node_y = nn.Linear(3, 1)(nn.Tanh()(node_x))
local net = nn.gModule({ node_x }, { node_y })

-- Then some trainging data that we will use to train
-- this model
local trainingData = {
  { x = torch.Tensor({ 0, 0 }), y = torch.Tensor({0}) },
  { x = torch.Tensor({ 0, 1 }), y = torch.Tensor({1}) },
  { x = torch.Tensor({ 1, 0 }), y = torch.Tensor({1}) },
  { x = torch.Tensor({ 1, 1 }), y = torch.Tensor({0}) },
}
local criterion = nn.MSECriterion()

-- Ok, let's train it!
local err = 1
while err > 0.001 do
  err = 0
  for i, d in pairs(trainingData) do
    err = err + criterion:forward(net:forward(d.x), d.y)
    net:zeroGradParameters()
    net:backward(d.x,
      criterion:backward(net.output, d.y))
    net:updateParameters(0.01)
  end
  err = err / #trainingData
  print("Training... Current network error: " .. err)
end

-- And finally, we save it to disk
torch.save('network.t7', net)
