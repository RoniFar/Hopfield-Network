% Hopfield network
clear; close all; clc;
tic

%% paramaters
% Set dimensions
N_input = 200;          %number of neurons in input layer
P_memory = 3;           %number of memory patterns to store
prob = [0, 0.1, 0.2, 0.3, 0.35, 0.36, 0.37, 0.38, 0.39, 0.4, 0.45, 0.5]; % probability vecor
Repetition = 50;

%% Creating Hopfiled net and store patterns.
[S, J] = MemoryPatterns(N_input,P_memory); 
choose_memory = randi(P_memory);  
Neuron_to_hopfield = ChangeNeuronProb(S,prob,choose_memory);
% %% task Ai
hopfield_outpot_01 = HopfieldNet(Neuron_to_hopfield,J,2,2);

%% task Aii
Imposition = superimposHopfiled(Repetition, S, J, prob, 2);

%% tast B
hopfield_outpot_all = HopfieldNet(Neuron_to_hopfield,J, 0);
Imposition_all_prob = superimposHopfiled(Repetition, S, J, prob);

%% plot

figure
plot(prob,Imposition_all_prob(1,:),'r','LineWidth', 3);
hold on
plot(prob,Imposition_all_prob(2,:),'b','LineWidth', 3);
plot(prob,Imposition_all_prob(3,:),'g','LineWidth', 3);
xlabel('probability' , 'fontsize' ,12);
ylabel('imposition rate', 'fontsize', 12);
legend('memory 1', 'memory 2', 'memory 3','Location','west','fontsize' ,12);
legend('boxoff');
title('imposition mean rate as function of probability value', 'fontsize' ,15);
parametersPrint = {['Repetition = ' num2str(Repetition)]};
subtitle(parametersPrint,'fontsize' ,12);
hold off

%%
toc
   
