clear all;

%----------frame 变换----------%
%定义初始矩阵
A_T_B = [ 1   0   0   1;
          0   1   0   1;
          0   0   1   1;
          0   0   0   1];

A_T_C = [ 0   0   1   5;
          0   1   0   1;
          1   0   0   1;
          0   0   0   1];
%坐标变换
B_T_C = inv(A_T_B)*A_T_C;

%------------------------------%      





%----------单点坐标变换---------%
%定义矢量坐标
A_P_O = [ 1; 0;  0;  1];
C_P_O = inv(A_T_C)*A_P_O;
%------------------------------%  


%@czh%