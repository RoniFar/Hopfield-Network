function SuperImposition = superimposHopfiled...
    (repet, StoredMemory, SynapInteraction, probability, N2Hop)

%random memory paterns matrix
% input:
    % repetition = number of time to apply hopfield net 
    % StoredMemory = matrix of patterns to save
        % col = num of pattern (mue)
        % row = num of nueron
    % SynapInteraction = matrox of sypatic intrections
    % probability = vec with probability elements
    % N2Hop = choose specific nueron from the matrix SynapInput and
    % apply the net only on it.
        % must be scalar.

% output:
    % SuperImposition:
        % column =  the mean Imposition for one prob val
        % row = memory number
      
% Description
    % num_of_neuron = number of neurons in input layer
    % memory_num = number of memory (patterns)
    % S_finel = matrix to save the output pattern to each repet.
    % choose_memory = the memory we change and work with.
    % HO_repet = struct that contain the outpur from hopfiled function.

[num_of_neuron,memory_num] = size(StoredMemory);
num_of_prob = length(probability);
S_finel = zeros(num_of_neuron,repet);
choose_memory = randi(memory_num);  

if nargin == 5 
    for rep = 1:repet        
        N2H_repet = ChangeNeuronProb(StoredMemory,probability,choose_memory);
        HO_repet = HopfieldNet(N2H_repet,SynapInteraction, 0, N2Hop);
        S_finel(:,rep) = HO_repet{1}.finelPat;
    end 
        M = StoredMemory' * S_finel / num_of_neuron;
        mean_impos = mean(M,2);
else
    mean_impos = zeros(memory_num,num_of_prob); 
    for rep = 1:repet 
        N2H_repet = ChangeNeuronProb(StoredMemory,probability,choose_memory);
        HO_repet = HopfieldNet(N2H_repet,SynapInteraction,0);    
            for q = 1:num_of_prob
                S_table{rep}(:,q) = HO_repet{q}.finelPat;
            end
    end
    
    S_finel = cell2mat(S_table);    
    for q = 1:num_of_prob
        SS_finel = S_finel(:,q:12:end);
        Match = StoredMemory' * SS_finel / num_of_neuron;
        mean_impos(:,q) = mean(Match,2);
    end
                
end    
SuperImposition = mean_impos;
  
end
