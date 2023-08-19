[t,x]= ode45(@pendulumpid, [0,10], [0,0,0]);

% Calculate e,ed and u
zm= sin(t);
zmd= cos(t);
e= zm-x(1);
ed= zmd-x(2);
kp = 15;
kd = 0.05;
ki = 10;
u = kp * e + kd * ed + ki * x(3);

% Create a table with e, ed, and u
data = [e,ed,u];

% Save the table to an Excel file
filename = 'output_data.xlsx';
xlswrite(filename, data, 'Sheet1', 'A1:C1');


% Save e and ed to an Excel file
%filename_error = 'error_data.xlsx';
%data_error = horzcat(e, ed);
%writematrix(data_error, filename_error, 'Sheet', 1);

% Save u to a separate Excel file with custom output name
%output_name = 'output_u.xlsx';
%writematrix(u, output_name, 'Sheet', 1);


plot(t,x(:,1));
hold on
plot (t,sin(t), ':r')
xlabel('time (sec)'), ylabel= ('Displacement (mm)');
legend('actual value', 'desired value')
grid on 
figure(2)
plot(t,x(:,1)-sin(t), 'linewidth',2);
grid on
xlabel('time (sec)'), ylabel= ('tracking error (mm)');
