function dx= pendulumpid(~,~)

t = 10; % Create a time vector from 0 to 10 seconds 
x = [0; 0; 0]; % Initial state: theta = 0, theta_dot = 0, integral_error = 0
%dx = pendulumpid(t, x);

%m= 2.565; Kz= 25.2; Ki= 40; c= 0.001;
%DataType = 'double';
%t_rad = deg2rad(t); % Convert time from seconds to radians
    
    %zm = sin(t_rad);     % Desired position (reference)
    %zmd = cos(t_rad);    % Desired velocity
zm= sin(t);
zmd= cos(t);
e= zm-x(1);
ed= zmd-x(2);
kp= 15; kd=0.05; ki= 10;
m = 0.1; % mass
L = 0.5; % length
g = 9.8;% acceleration due to gravity
b= 1;
%u= 0;


u= kp*e+ kd*ed+ ki*x(3);
x1dot= x(2);
x2dot= -((g/L)*sin(x(1)))-((b/m*L^2))*x(2)+ ((1/(m*L^2))*u);
x3dot = e;

dx= [x1dot;x2dot;x3dot];
disp('Value of e:');
disp(e);

disp('Value of ed:');
disp(ed);

%u = kp*e + kd*ed + ki*x(3);

disp('Value of u:');
disp(u);



