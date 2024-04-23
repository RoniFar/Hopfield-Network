function NeuronMemoryProb = ChangeNeuronProb(stored_memory,probability,rand_memory)
%change nueron sign
% input:
    % stored_memory = matrix of patterns to save
    % probability = vec with probability elements
    % rand_memory = the number of memo to change
% output:
    % NeuronMemoryProb = cell #q is pattern vector that its sign change
        % with the probability in organ #q.

% Description
    % neuronsToChange = nueron that will change according probability vec
    % MemoryMat = matrix with optional memory 
    % prob_vec = vec with 2 organ
        % prob_vec(1) = the probability that the nueron doenst chage sign
        % prob_vec(2) = the probability that the nueron does chage sign
    % sign_vec = [1 -1]
        % with randsample funcrion we choose 1 or -1 by the probabilitys in
        % prob_vec and than double the neuren with the choosen sign

        
neuron_num = size(stored_memory,1);
num_of_prob = length(probability);
NeuronMemoryProb = cell(num_of_prob,1);

    for q = 1:num_of_prob                  
        neuronsToChange = stored_memory(:,rand_memory);
        prob_vec = [1 - probability(q) , probability(q)];
        sign_vec = [1 , -1];
        for i = 1:neuron_num
            choose_sign = randsample(sign_vec,1, true, prob_vec);
            neuronsToChange(i) = neuronsToChange(i) * choose_sign;
        end
        NeuronMemoryProb{q} = neuronsToChange;

    end   
    
end