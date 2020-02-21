function [x, x_stacked] = extract_results_per_region(mpc, names)
    [vang, vmag, pnet, qnet] = extract_results(mpc);
    regions = mpc.(names.regions.global);
    N_regions = numel(regions);
    
    [x, x_stacked] = deal(cell(N_regions, 1));
    
    for i = 1:N_regions
        buses = regions{i};
        x{i} = [vang(buses), vmag(buses), pnet(buses), qnet(buses)];
        x_stacked{i} = stack_state(vang(buses), vmag(buses), pnet(buses), qnet(buses));
    end
end