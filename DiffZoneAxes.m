% Simulate diffraction pattern in Transmission Election Microscopy using
% different zone axes
% Author: Nafis Ahmed
% Last Updated: 03/23/2020

clear;
% generate combinations of various zone axes
x = [0 0 1];              % Set of possible digits in zone axes
K = 3;                      % Length of each permutation

% Create all possible permutations (with repetition) of letters stored in x
C = cell(K, 1);             % Preallocate a cell array
[C{:}] = ndgrid(x);         % Create K grids of values
C = cellfun(@(x){x(:)}, C); % Convert grids to column vectors
C = [C{:}];                 % Obtain all permutations
C = unique(C, 'rows');      % delete any repeated rows

% present an option to load or build lattice structure
que = 'Press Enter to build a lattice structure or type in the full file path to load a pre-existing one .\n';
choice = input(que, 's');
choice = strtrim(choice);

if isempty(choice)
    % build lattice structure
    prompt = 'Let''s build the lattice structure.\n >> Symbol?\n';
    Lattice.Symbol = input(prompt, 's');
    type = '>> Type?\n';
    Lattice.Type = input(type, 's');
    a_length = 'Cell length a?\n';
    Lattice.a = input(a_length);
    b_length = 'Cell length b?\n';
    Lattice.b = input(b_length);
    c_length = 'Cell length c?\n';
    Lattice.c = input(c_length);
    alpha = 'Alpha?\n';
    Lattice.alpha = input(alpha);
    beta = 'Beta?\n';
    Lattice.alpha = input(beta);
    gamma = 'Gamma?\n';
    Lattice.alpha = input(gamma);
    pos = 'Atomic positions? Insert in the form [a b c; d e f; g h i; ...]\n';
    Lattice.AtomicPositions = input(pos);
    type = 'Atomic types? Insert in the form [x y z]. You may leave it empty if the lattice structure is not a molecule.\n';
    Lattice.AtomicTypes = input(type);
    
    % option to save this lattice structure as a MATLAB file if the user wants
    saveStruc = 'Press ''Y'' to save this lattice structure as a MATLAB file.\n';
    response = input(saveStruc, 's');
    response = strtrim(upper(response));
    if strcmp(response, 'Y')
        strucName = 'What would you like to name this lattice structure?\n';
        name = input(strucName, 's');
        save(name, 'Lattice');
    end
else
    load(choice);
end

% probe
Probe.Type = 'electrons';
Probe.Energy = 60000;

% detector
Detector.Shape = 'square'; 
Detector.Size = 16;  
Detector.SpotFWHMx = 0.3;
Detector.SpotFWHMy = 0.3;
Detector.DistanceToSample = 200; 
Detector.Offset = [0 0];

% simulate diffraction pattern in Transmission Election Microscopy using
% different zone axes
for n = 1:length(C)
    Lattice.Normal = C(n,:);
    I = GeometricalSimulation2(Lattice,Probe,Detector,-6:6,n);
end