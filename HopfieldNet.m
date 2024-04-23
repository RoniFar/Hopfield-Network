function SynapOut = HopfieldNet(SynapInput,SynapInteraction, Plot, nueronToHop)

%random memory paterns matrix
% input:
    % SynapInput = cells. each cell is pattern we apply the net on.
    % SynapInteraction = matrox of sypatic intrections
    % Plot = plot enegry fuction by time
        % Plot = scalar index bettwen 0 to length of prob vec (eq to length
            % of SynapInput
        % 0 - dont print figure
        % scalar - print figure for the wanted index
    % nueronToHop = choose specific nueron from the matrix SynapInput and
    % apply the net only on it.
        % must be scalar.             
% output:
    % SynapOut = struct that contain:
        % SynapOut.time = number of time step till the process convergence.
            % one time step eq to one nueron update.
        % SynapOut.counter = number of full step till the process
        % convergence. 
            % one full step eq to ome input pattern update (after all 
            % the neuron in pattern got update)
        % SynapOut.energy = matix
            % col = num of nueron
            % row = the sistem energy val eah time step
        % SynapOut.finelPat = finel patten
    
% Description
    % fist loop runing on the number of patterns represented to the net.
    % second loop run till we get convergence to steady point or till
    % counter reach max_full_steps.
    % Sold = save state for break condition.
        % if s(t)=s(t+1) break loop.
    % h(i) = calculate by the formula for each nueron and initialised to 0
    % when we pass to the next nueron.

    
% choosing the wanted nueron if asked and define SynapInput as cell for the
% enable the funcion keep running. and fix Plot scalar for one neuron.
if nargin == 4
   SynapInput = SynapInput{nueronToHop};
   SynapInput = mat2cell(SynapInput,size(SynapInput,1),size(SynapInput,2));
   if Plot ~= 0
       Plot = 1;
   end
end

[neurons_num, memory_num] = size(SynapInput{1});
SynapOut = cell(size(SynapInput));
max_full_steps = 50000;

for l = 1:length(SynapInput)
    SynapOut{l}.time = 0;
    SynapOut{l}.counter = 0;
    SynapOut{l}.energy = zeros(1,memory_num);
    flag = 1; 
    
    while flag > 0
        SynapOut{l}.counter = SynapOut{l}.counter + 1;
        Sold = SynapInput{l};              
        
        for i = 1:neurons_num
            SynapOut{l}.time = SynapOut{l}.time + 1;
            h(i) = 0;
            
            for j = 1:neurons_num
                h(i) = h(i) + SynapInteraction(i,j)*SynapInput{l}(j);
            end
            
            SynapInput{l}(i) = sign(h(i));
            E{SynapOut{l}.time} = EnergyFunction(SynapInput{l}, SynapInteraction);         
            SynapOut{l}.energy = [SynapOut{l}.energy; E{SynapOut{l}.time}];
        end
        
        if Sold == SynapInput{l}
            flag = 0;
        end
        
        if SynapOut{l}.counter > max_full_steps
            flag = 0;
        end

        SynapOut{l}.energy = SynapOut{l}.energy(2:end,:);
        SynapOut{l}.finelPat = SynapInput{l};
    end

end

if Plot ~= 0
    figure
    Plot1 = plot(SynapOut{Plot}.energy(:,1));
    Plot1.LineWidth = 4;
    Plot1.Color = 'b';
    title('Hopfield net energy per Time step' ,'fontsize',17);
    xlabel('Time step','fontsize',15);
    ylabel('Energy','fontsize',15);
end
end