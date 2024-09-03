%该代码用于，已经知道坐标系任意两个轴的坐标时，生产完整的旋转矩阵%
clear all;
%初始化坐标轴
axis_i = [ 0;  0;  0];    %对于未知的坐标轴，设置成全0
axis_j = [ 0;  0; -1];
axis_k = [-4; -2;  0];
P = [2; 3; 4];            %原点坐标

A_R_B = Rotation(axis_i,axis_j,axis_k);
A_T_B = Transform(axis_i,axis_j,axis_k,P);



%-----用于生成齐次变换矩阵----%
function T = Transform(axis_i,axis_j,axis_k,P)
    R = Rotation(axis_i,axis_j,axis_k);
    T = eye(4);
    T(1:3, 4) = P;   
    T(1:3, 1:3) = R;  
end

%-----用于生成旋转矩阵----%
function R = Rotation(axis_i,axis_j,axis_k)

    %生成未知的轴
    unkown_axis = 0;
    if axis_i == zeros(3,1)   unkown_axis=1;  end
    if axis_j == zeros(3,1)   unkown_axis=2;  end
    if axis_k == zeros(3,1)   unkown_axis=3;  end
    switch(unkown_axis)
        case 1 
            axis_j = axis_j / norm(axis_j);
            axis_k = axis_k / norm(axis_k);
            axis_i = cross(axis_j, axis_k);
        case 2 
            axis_i = axis_i / norm(axis_i);
            axis_k = axis_k / norm(axis_k);
            axis_j = cross(axis_k, axis_i);
        case 3 
            axis_i = axis_i / norm(axis_i);
            axis_j = axis_j / norm(axis_j);
            axis_k = cross(axis_i, axis_j);
        otherwise
            error('Invalid rotation axis.');
    end

    R = [axis_i, axis_j, axis_k];
end

%@czh%