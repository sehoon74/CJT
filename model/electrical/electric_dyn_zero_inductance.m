%ELECTRIC_DYN_ZERO_INDUCTANCE Get linear dynamics matrices for the
%electrical subsystem when inductance can be ignored
%
% [A, B, C, D] = jointObj.electric_dyn
%
% jointObj is the instance of the joint class object for which this
% function has been called.
%
% Outputs::
%   A:   System matrix
%   B:   Input matrix
%   C:   Output matrix
%   D:   Direct Feedthrough matrix
%
% Notes::
%
%
% Examples::
%
% Author::
%  Joern Malzahn
%  Wesley Roozing
%
% See also full_dyn, output_fixed.

% Copyright (C) 2016, by Joern Malzahn, Wesley Roozing
%
% This file is part of the Compliant Joint Toolbox (CJT).
%
% CJT is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% CJT is distributed in the hope that it will be useful, but WITHOUT ANY
% WARRANTY; without even the implied warranty of MERCHANTABILITY or
% FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
% License for more details.
%
% You should have received a copy of the GNU General Public License
% along with CJT. If not, see <http://www.gnu.org/licenses/>.
%
% For more information on the toolbox and contact to the authors visit
% <https://github.com/geez0x1/CompliantJointToolbox>


function [A, B, C, D] = electric_dyn_zero_inductance(obj)
    
    % With neglected winding inductance the model becomes a static gain for
    % the back emf and input voltage.
    
    R = obj.r;
    k_t = obj.k_t; % Torque constant.
    N = obj.n;
    
    % State-space matrix
    A = 0;
    
    % u = [v, dot{q_m}] input voltage v and motor velocity dot{q_m}
    B = [0 0];
    
    % Output
    C = 0;
    
    % Direct Feedthrough of input voltage and back emf
    D = [1/R, -k_t*N/R];

end
