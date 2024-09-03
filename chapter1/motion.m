%改代码用于计算frame的运动%'
clear all;

%定义旋转轴
axis_x = 1;
axis_y = 2;
axis_z = 3;


%%%%%%%计算实例%%%%%%%%%%

%定义初始的坐标
A_T_B = [1   0   0   1;
         0   1   0   1;
         0   0   1   2;
         0   0   0   1];


A_T_B1 = A_T_B *T_Rot(axis_x,20);
A_T_B2 = A_T_B1 * T_Trans(1,20,2);
A_T_B3 = T_Rot(axis_z,20) * A_T_B2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








%定义函数
%---定义生成motion的齐次变换矩阵   
%输入：rot_axis：旋转轴    rot_angle: 旋转角度 Deg
%--------------------------%
function T=T_Rot(rot_axis, rot_angle)
  switch(rot_axis)
      %绕x轴旋转
      case 1    
          Rot = rotx(rot_angle); 
      %绕x轴旋转
      case 2   
          Rot = roty(rot_angle);
      %绕x轴旋转
      case 3   
          Rot = rotz(rot_angle);
      otherwise
            error('Invalid rotation axis.');
  end
  T = eye(4);
  % 将旋转矩阵嵌入到齐次变换矩阵
  T(1:3, 1:3) = Rot;   
end


function T=T_Trans(x,y,z)
  
  translation = [x; y; z];  % 平移向量

  T = eye(4);
  % 将平移向量嵌入到齐次变换矩阵
  T(1:3, 4) = translation;   
end

%@czh%
