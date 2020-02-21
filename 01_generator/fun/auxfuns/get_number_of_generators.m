% 1. return the number of generators in casefile 
function Ngen = get_number_of_generators(mpc)
% INPUT
% mpc   -- matpower case file
    Ngen       = size(mpc.gen, 1); % numbers of generator in totoal
end