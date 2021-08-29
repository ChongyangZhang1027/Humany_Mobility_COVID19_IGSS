% this program is used to do regression between the data of safegraph and the data from twitter

flow_sg = flow_sg_resv;
flow_tw = flow_tw_resv;

index = [78:-1:73,71:-1:57,52,43,14,7,3];

for i = 1:26
    flow_sg(index(i), :) = [];
    flow_tw(index(i), :) = [];
end

for i = 1:26
    flow_sg(:, index(i)) = [];
    flow_tw(:, index(i)) = [];
end
flow_sg = reshape(flow_sg,[52*52,1]);
flow_tw = reshape(flow_tw,[52*52,1]);

n=52*52;
X=[ones(n,1),flow_tw];
[b,bint,r,rint,s]=regress(flow_sg,X,0.05);

figure('color',[1,1,1]);
sg = flow_sg;
tw = flow_tw;
subplot(1,2,1);
scatter(tw, sg);
xlabel('Human Mobility according to Tweets');
ylabel('Human Mbility according to Safegraph');
title('First Order Regression Analysis');
hold on;
plot(tw, b(2)*tw + b(1), 'r');

% clear some abnormal data points
flow_sg(2280) = [];
flow_sg(1697) = [];
flow_sg(478) = [];
flow_sg(213) = [];
flow_tw(2280) = [];
flow_tw(1697) = [];
flow_tw(478) = [];
flow_tw(213) = [];
X=[ones(n-4,1),flow_tw];
[b1,bint1,r1,rint,s1]=regress(flow_sg,X,0.05);
% rcoplot(r,rint);

subplot(1,2,2);
scatter(flow_tw, flow_sg);
xlabel('Human Mobility according to Tweets');
ylabel('Human Mbility according to Safegraph');
title('Regression Analysis with Selected Data');
hold on;
plot(flow_tw, b1(2)*flow_tw + b1(1), 'r');


