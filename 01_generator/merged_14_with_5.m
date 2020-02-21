function mpc = merged_14_with_5
%MERGED_14_WITH_5

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
	1	3	0	0	0	0	1	1.06	0	0	1	1.06	0.94;
	2	2	21.7	12.7	0	0	1	1.045	-4.98	0	1	1.06	0.94;
	3	2	94.2	19	0	0	1	1.01	-12.72	0	1	1.06	0.94;
	4	1	47.8	-3.9	0	0	1	1.019	-10.33	0	1	1.06	0.94;
	5	1	7.6	1.6	0	0	1	1.02	-8.78	0	1	1.06	0.94;
	6	2	11.2	7.5	0	0	1	1.07	-14.22	0	1	1.06	0.94;
	7	1	0	0	0	0	1	1.062	-13.37	0	1	1.06	0.94;
	8	2	0	0	0	0	1	1.09	-13.36	0	1	1.06	0.94;
	9	1	29.5	16.6	0	19	1	1.056	-14.94	0	1	1.06	0.94;
	10	1	9	5.8	0	0	1	1.051	-15.1	0	1	1.06	0.94;
	11	1	3.5	1.8	0	0	1	1.057	-14.79	0	1	1.06	0.94;
	12	1	6.1	1.6	0	0	1	1.055	-15.07	0	1	1.06	0.94;
	13	1	13.5	5.8	0	0	1	1.05	-15.16	0	1	1.06	0.94;
	14	1	14.9	5	0	0	1	1.036	-16.04	0	1	1.06	0.94;
	15	1	0	0	0	0	1	1	0	345	1	1.1	0.9;
	16	2	0	0	0	0	1	1	0	345	1	1.1	0.9;
	17	2	0	0	0	0	1	1	0	345	1	1.1	0.9;
	18	1	0	0	0	0	1	1	0	345	1	1.1	0.9;
	19	1	90	30	0	0	1	1	0	345	1	1.1	0.9;
	20	1	0	0	0	0	1	1	0	345	1	1.1	0.9;
	21	1	100	35	0	0	1	1	0	345	1	1.1	0.9;
	22	1	0	0	0	0	1	1	0	345	1	1.1	0.9;
	23	1	125	50	0	0	1	1	0	345	1	1.1	0.9;
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	1	232.4	-16.9	10	0	1.06	100	1	332.4	0	0	0	0	0	0	0	0	0	0	0	0;
	2	40	42.4	50	-40	1.045	100	1	140	0	0	0	0	0	0	0	0	0	0	0	0;
	3	0	23.4	40	0	1.01	100	1	100	0	0	0	0	0	0	0	0	0	0	0	0;
	6	0	12.2	24	-6	1.07	100	1	100	0	0	0	0	0	0	0	0	0	0	0	0;
	8	0	17.4	24	-6	1.09	100	1	100	0	0	0	0	0	0	0	0	0	0	0	0;
	16	163	0	300	-300	1	100	1	300	10	0	0	0	0	0	0	0	0	0	0	0;
	17	85	0	300	-300	1	100	1	270	10	0	0	0	0	0	0	0	0	0	0	0;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
	1	2	0.01938	0.05917	0.0528	0	0	0	0	0	1	-360	360;
	1	5	0.05403	0.22304	0.0492	0	0	0	0	0	1	-360	360;
	2	3	0.04699	0.19797	0.0438	0	0	0	0	0	1	-360	360;
	2	4	0.05811	0.17632	0.034	0	0	0	0	0	1	-360	360;
	2	5	0.05695	0.17388	0.0346	0	0	0	0	0	1	-360	360;
	3	4	0.06701	0.17103	0.0128	0	0	0	0	0	1	-360	360;
	4	5	0.01335	0.04211	0	0	0	0	0	0	1	-360	360;
	4	7	0	0.20912	0	0	0	0	0.978	0	1	-360	360;
	4	9	0	0.55618	0	0	0	0	0.969	0	1	-360	360;
	5	6	0	0.25202	0	0	0	0	0.932	0	1	-360	360;
	6	11	0.09498	0.1989	0	0	0	0	0	0	1	-360	360;
	6	12	0.12291	0.25581	0	0	0	0	0	0	1	-360	360;
	6	13	0.06615	0.13027	0	0	0	0	0	0	1	-360	360;
	7	8	0	0.17615	0	0	0	0	0	0	1	-360	360;
	7	9	0	0.11001	0	0	0	0	0	0	1	-360	360;
	9	10	0.03181	0.0845	0	0	0	0	0	0	1	-360	360;
	9	14	0.12711	0.27038	0	0	0	0	0	0	1	-360	360;
	10	11	0.08205	0.19207	0	0	0	0	0	0	1	-360	360;
	12	13	0.22092	0.19988	0	0	0	0	0	0	1	-360	360;
	13	14	0.17093	0.34802	0	0	0	0	0	0	1	-360	360;
	15	18	0	0.0576	0	250	250	250	0	0	1	-360	360;
	18	19	0.017	0.092	0.158	250	250	250	0	0	1	-360	360;
	19	20	0.039	0.17	0.358	150	150	150	0	0	1	-360	360;
	17	20	0	0.0586	0	300	300	300	0	0	1	-360	360;
	20	21	0.0119	0.1008	0.209	150	150	150	0	0	1	-360	360;
	21	22	0.0085	0.072	0.149	250	250	250	0	0	1	-360	360;
	22	16	0	0.0625	0	250	250	250	0	0	1	-360	360;
	22	23	0.032	0.161	0.306	250	250	250	0	0	1	-360	360;
	23	18	0.01	0.085	0.176	250	250	250	0	0	1	-360	360;
	2	15	0	0.00623	0	0	0	0	0.985	0	1	0	0;
];
