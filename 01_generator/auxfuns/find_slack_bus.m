function bus = find_slack_bus(mpc)
% find_slack_bus
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
[PQ, PV, REF, NONE, BUS_I, BUS_TYPE, PD, QD, GS, BS, BUS_AREA, VM, ...
            VA, BASE_KV, ZONE, VMAX, VMIN, LAM_P, LAM_Q, MU_VMAX, MU_VMIN] = idx_bus;
    bus = find(mpc.bus(:, BUS_TYPE) == REF);
end