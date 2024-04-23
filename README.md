# Hopfield-Network
This code simulates a numerical simulation of a Hopfield network with 𝑁=200 neurons without noise (𝑇=0).

Task Description:
The program uses asynchronous sequential dynamics, meaning that at each step, the state of one of the neurons is updated, according to their indices order, using the current state of the network.

Instructions:
Choose three random network states and embed them as network memories by creating an appropriate matrix of weights. Now:
a. Choose one of the memories, and for each neuron, flip the value with a probability 𝑞=0.1. Present the resulting state as the initial state of the network and run the network until it converges. Also, add a graph of the energy as a function of time steps and check if it decreases.
b. Repeat this 50 times and calculate the final average overlap with the original memory and with the other two. (A graph of this is not required.)
Return to step 'a' for the following 𝑞 values:
𝑞 ∈ {0, 0.1, 0.2, 0.3, 0.35, 0.36, 0.37, 0.38, 0.39, 0.4, 0.45, 0.5}
Submit graphs of the final overlap with each of the three memories as a function of 𝑞.
Also, include an energy convergence graph for one of the simulations.
How to Run:
Run the main.m script to execute the simulation.

Files Description:
# main.m: Matlab script for running the simulation.
# ChangeNeuronProb.m: function that change nueron sign
# EnergyFunction.m: calculate sistem cuurent energy.
# HopfieldNet.m: random memory paterns matrix
# MemoryPatterns.m: random memory paterns matrix.
# superimposHopfiled.m: the mean Imposition for one prob val
