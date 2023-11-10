load("diagram.txt");

% Diagram ábrázolása
figure;
hold on;

x = diagram(:,1);
z = diagram(:,3);
z_ = diagram(:,4);
yyaxis left
plot(x,z,'LineWidth', 1.5)
hold on
plot(x,z_,'c-','LineWidth', 1.5)
ylabel('Current (A)')

y = diagram(:,2);
yyaxis right
plot(x,y,'LineWidth', 1.5)

legend('Current of R1 resistance', 'Current of the varicap', 'Input Voltage')
xlabel('Time (s)')
ylabel('Voltage (V)')
