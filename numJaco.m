function [J_mat] = numJaco(func_vec,x)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 
    % This code was made by Shuang Liu@Tokyo UT
    % liu@bee.t.u-tokyo.ac.jp
    % You can distribute or modify as you want, 
    % but please do not erase this comment 
    % - 2020.04.23
    %
    % Input : func_vec, cell of function handles
    %         x, evalute point
    % Output: Numaical Jacobian matrix
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % example input1: 
    %   func_1 = @(x) x(1).^2 +x(2).^2
    %   J = numJaco({func_1},[2;3]) give you J=[4.0000    6.0000]
    % example input2:
    %   func_1 = @(x) x(1).^2 +x(2).^2
    %   func_2 = @(x) x(1).^2 
    %   func_3 = @(x) x(2).^2 
    %   J = numJaco({func_1,func_2,func_3},[2;3]) give you 
    %     J =
    % 
    %     4.0000    6.0000
    %     4.0000         0
    %          0    6.0000
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    dim_func = length(func_vec);
    if ~isa(func_vec,'cell')
        disp('The input func_vec must be a cell of function handles, like {f1} or {f1;f2;f3}')
        return 
    end
    dim_x = length(x);
    J_mat = zeros(dim_func,dim_x);
    for idx = 1:dim_func
        J_mat(idx,:) = oneRowFuncGradient(func_vec{idx},x);
    end
end

% local function to calculate center differntial,

function [dfdx] = oneRowFuncGradient(func,x)
    % test 
    % you can change delta for higher precision.
    delta=10^-6;
    dfdx = zeros(1,length(x));
    dim_x = length(x);
    for idx = 1:dim_x
        x_l = x;
        x_r = x;
        x_l(idx) = x_l(idx) - delta;
        x_r(idx) = x_r(idx) + delta;
        
        dfdx(1,idx) = (func(x_r) - func(x_l))./(2.*delta);
    end
end