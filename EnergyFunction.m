function energyVal = EnergyFunction(s_update, SynapInteraction)
% calculate sistem cuurent energy 
% input:
    % s_update = neuron state at cuurent time
    % SynapInteraction = matrox of sypatic intrections
% output:
    % energyVal = sistem energy givven by the fomula

energyVal = - 1/2 * s_update' * SynapInteraction * s_update; 

end