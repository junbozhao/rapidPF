function [y, y_stacked] = extract_results_per_region_with_copies(mpc, names)
% extract_results_per_region_with_copies
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
    [x, ~] = extract_results_per_region(mpc, names);
    x_full = vertcat(x{:});
    ang_mag_full = x_full(:, 1:2);
    copy_global = mpc.(names.copy_buses.global);
    
    N_regions = numel(copy_global);
    [y, y_stacked] = deal(cell(N_regions, 1));
    
    for i = 1:N_regions
        buses = copy_global{i};
        assert(issorted(buses), 'copy buses in region %i are not sorted, which can cause issues.', i);
        
        ang_mag = ang_mag_full(buses, :);
        y{i} = [ x{i}; [ang_mag, NaN*ones(size(ang_mag))] ];
        
        % stack solution and remove NaN entries
        [rows, cols] = size(y{i});
        y_stacked{i} = reshape(y{i}, rows*cols, 1);
        inds = isnan(y_stacked{i});
        y_stacked{i}(inds) = [];
    end 
end