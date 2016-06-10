%% [A, B, C, I, D, K] = full_dyn_TJ(obj)
% Get dynamics matrices - default, torque-jerk states

function [A, B, C, I, D, K] = full_dyn_TJ(obj)
    
    % x = [tau_g, tau_l, tau_e, tau_g_dot, tau_l_dot, tau_e_dot]'
    
    % Get position-velocity states
    [A, B, C, I, D, K] = obj.full();

    k_g = obj.k_g;
    k_b = obj.k_b;
    k_e = obj.k_e; % shorthands %#ok<*PROP>
    T = [   -k_g,	k_g,	0;
            0,      -k_b,	k_b;
            0,      0,      k_e     ];

    Tx = [	T,                  zeros(size(T));
            zeros(size(T)),  	T                   ];

    A = Tx*A/Tx;
    B = Tx*B;
    
    C = Tx\C;
    
end