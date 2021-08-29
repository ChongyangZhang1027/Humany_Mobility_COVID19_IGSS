% this program is used to calculate the total inflow and outflow population according to the csv data

data=csvread('tw_od_2020_state2.csv',1,0);
flow = zeros(78, 78);
for i = 1:length(data(:,1))
    flow(data(i,1), data(i,2)) = flow(data(i,1), data(i,2)) + data(i,3);
end
inter_flow = diag(flow);
in_flow = sum(flow, 1)' - inter_flow;
out_flow = sum(flow, 2) - inter_flow;
result = [inter_flow, in_flow, out_flow];
result_show = [result(6,:); result(12,:); result(15,:); result(17,:);...
    result(36,:); result(42,:); result(48,:)];
% 3 7 14 43 52 57-71 73-78
