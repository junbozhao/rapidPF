function tab = build_connection_table(connections, trafo_pars)
% build_connection_table
%
%   `copy the declaration of the function in here (leave the ticks unchanged)`
%
%   _describe what the function does in the following line_
%
%   # Markdown formatting is supported
%   Equations are possible to, e.g $a^2 + b^2 = c^2$.
%   So are lists:
%   - item 1
%   - item 2
%   ```matlab
%   function y = square(x)
%       x^2
%   end
%   ```
%   See also: [run_case_file_splitter](run_case_file_splitter.md)
    N = size(connections, 1);
    
    from_sys = connections(:, 1);
    to_sys = connections(:, 2);
    from_bus = connections(:, 3);
    to_bus = connections(:, 4);
    trafo_pars = check_trafo_params(trafo_pars, N);
    connections = [1:N]'; 
    tab = table(from_sys, to_sys, from_bus, to_bus, trafo_pars, 'RowNames', string(connections));
    tab = check_ordering(tab);
end

function pars = check_trafo_params(pars, N)
    if isstruct(pars)
        pars = repmat({pars}, N, 1);
        warning('Assuming the same transformer parameters for all connections. Please double-check.')
    else
        assert(numel(pars) == N, 'inconsistent number of transformer parameters.');
    end
end

function tab = check_ordering(tab)
    % check whether from_sys < to_sys holds everywhere
    % if not, then swap system and bus entries
    inds = ~(tab.from_sys < tab.to_sys);
    if sum(inds) ~= 0
        warning('fixing inconsistent connection labelling (from_sys < to_sys not satisfied everywhere).');
        
        f = tab.from_sys(inds);
        t = tab.to_sys(inds);
        tab.from_sys(inds) = t;
        tab.to_sys(inds) = f;
        
        f = tab.from_bus(inds);
        t = tab.to_bus(inds);
        tab.from_bus(inds) = t;
        tab.to_bus(inds) = f;
    end
end