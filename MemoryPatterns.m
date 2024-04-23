function [StoredMemory ,SynapInteraction] = MemoryPatterns(neurons,memoryNum)
%random memory paterns matrix
% input:
    % neurons = number of neurons in input layer
    % memoryNum = number of memory patterns
        % if not define the function calculate the number of max patterns
        % the net can get by the formula Pmax = N/(2*ln(N)).
% output:
    % MemoryMat = bimary matrix of memory patters
        % each column is one memory pattern 
    % StoredMemory = matrix of patterns to save
        % col = num of pattern (mue)
        % row = num of nueron
    % SynapInteraction = matrox of sypatic intrections
        % SynapInteraction(i,i) = 0 
      
% Description
    % maxPattern = num of patterns the net can store
    % MemoryMat = matrix with optional memory 
    % alpha_c = 1/ 2 ln(N);
    % maxPattern = N * alpha_c;   
    
alpha_c = 1/ (2*log(neurons));
maxPattern = round(neurons * alpha_c);    

% create memory matrix
MemoryMat = round(rand(neurons,maxPattern));
MemoryMat(MemoryMat == 0) = -1;

% choose random memory memory patterns to store in the net
perm = randperm(maxPattern);
StoredMemory = zeros(neurons,memoryNum);

for j = 1:memoryNum
    StoredMemory(:,j) = MemoryMat(:,perm(j));
end

SynapInteraction = StoredMemory*StoredMemory' - memoryNum*eye(neurons) / neurons;

end

