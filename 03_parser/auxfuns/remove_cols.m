function J = remove_cols(J, buses_to_ignore, n)
    if ~isempty(buses_to_ignore)
        cols = entries_to_delete(buses_to_ignore, n);
        J(:, cols) = [];
    end
end

