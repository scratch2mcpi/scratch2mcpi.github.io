#!/usr/bin/python
import mcpi.minecraft as minecraft
import mcpi.block as block

mc = minecraft.Minecraft.create()

for x in range(-10, 10):
  for y in range(20, 40):
    for z in range(-10, 10):
      if (x * x + (y - 30) * (y - 30) + z * z < 10 * 10):
        mc.setBlock(x, y, z, block.STONE)
