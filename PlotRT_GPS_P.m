% plot Real-time gps data
% RT_Plot_GPS_P

figure
x = [1 2];
y = [4 4];
plot(x,y);
xlim([0 100])
ylim([2.5 4])
xlabel('Iteration')
ylabel('Approximation for \pi')

linkdata on

denom = 1;
k = -1;
for t = 3:100
    pause(1)
    denom = denom + 2;
    x(t) = t;
    y(t) = 4*(y(t-1)/4 + k/denom);
    k = -k;
end

x = 0; %?初始数bai据
y = 0; %?初始数据
figure(1)


plot(x,y,'^r');
grid on
hold on %?若之前的图du像不想保留，则把hold?on注释掉
xlabel('x');
ylabel('y');
for i=1:10
    x = x + 1; %?更新zhi后数据
    y = y + 1; %?更新后数据
    plot(x, y, '^r');
    grid on
    hold on % 若之前的图像不想保留，则把hold?on注释掉
    pause(0.2);
end


