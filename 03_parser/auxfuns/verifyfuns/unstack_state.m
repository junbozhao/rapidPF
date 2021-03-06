function [ang, mag, p, q] = unstack_state(x)
% unstack_state
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
    N = numel(x) / 4;
    X = reshape(x, N, 4);
    ang = X(:,1);
    mag = X(:,2);
    p = X(:,3);
    q = X(:,4);
end
