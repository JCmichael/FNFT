% MEX_FNFT_NSEP Fast nonlinear Fourier transform for the nonlinear
% Schroedinger equation with (quasi-)periodic boundaries.
%
%   [main_spec, aux_spec] = MEX_FNFT_NSEP(q, T, kappa)
%   [main_spec, aux_spec] = MEX_FNFT_NSEP(q, T, kappa, OPTIONAL INPUTS)
%
% DESCRIPTION
%   Provides an interface to the C routine fnft_nsep.
%
% INPUTS
%   q               Complex row vector of length D=2n>2. The first sample
%                   q(1) should correspond to T(1) and the last sample
%                   q(D) should correspond to T(2)-(T(2)-T(1))/D.
%   T               Real 1x2 vector with T(2)>T(1).
%   kappa           +1.0 or -1.0
%
% OPTIONAL INPUTS
%   It is possible to provide additional inputs. These come either in the
%   form of a single string or of a string followed by a value.
%
%    'loc_subsample_and_refine' Localize spectra by applying fast eigenmethod
%                   to a subsampled version of the signal, then refine using
%                   the complete signal.
%    'loc_gridsearch' Localize real spectra by using a FFT-based grid search.
%    'loc_mixed'    Localize real spectra using grid search and non-real using
%                   subsample and refine (default).
%    'loc_max_evals' Maximum number of monodromy matrix evaluations after which
%                   refinement is stopped. (The acutual number might be slightly
%                   higher.) This argument must be followed by a real
%                   non-negative scalar.
%    'loc_Dsub'     Approximate number of samples after subsampling when subsample and
%                   refine is used. This argument must be followed by a real
%                   non-negative scalar.
%                   The default is zero, which means that the algorithm chooses
%                   the value automatically.
%    'filt_none'    Do not filter spectra.
%    'filt_manual'  Remove spectra outside a given bounding box. This argument
%                   must be followed by a real 1x4 vector [min_real max_real
%                   min_imag max_imag] that specifies the box.
%    'points_per_spine' main_spec contains the points in the complex plane at
%                   which the Floquet discriminant is equal to rhs, where rhs
%                   is iterated over an equidistant grid of points_per_spine
%                   real numbers with the first one being -1 and the last one
%                   being +1. This argument must be followed by a real
%                   non-negative integer. The default value is two, which
%                   results in the usual main spectrum (= endpoints of spines).
%                   Use higher values to visualize splines.
%    'phase_shift'  For quasi-periodic signals the phase changes over one 
%                   quasi-period. This argument must be followed by a real
%                   scalar i.e. angle(q(T(2))/q(T(1))). The default value 
%                   is 0.0, which assumes that q is periodic.
%   'discr_modal'   Use modified Ablowitz-Ladik discretization.
%   'discr_2split2A' Use split Boffetta-Osborne discretization (default).
%   'discr_2split4A' Use fifth order splitting with 4th degree polynomial.
%   'discr_2split4B' Use fifth order splitting with 2nd degree polynomial.
%   'discr_4split4B' Fourth-order method. Uses fifth order splitting with
%                    2nd degree polynomial.
%    'quiet'        Turns off messages generated by then FNFT C library.
%                   (To turn off the messages generated by the mex
%                   interface functions, use MATLAB's warning and error
%                   commands instead.)
%
% OUTPUTS
%   main_spec       Complex row vector
%   aux_spec        Complex row vector

% This file is part of FNFT.
%
% FNFT is free software; you can redistribute it and/or
% modify it under the terms of the version 2 of the GNU General
% Public License as published by the Free Software Foundation.
%
% FNFT is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program. If not, see <http://www.gnu.org/licenses/>.
%
% Contributors:
% Sander Wahls (TU Delft) 2018, 2020.
% Shrinivas Chimmalgi (TU Delft) 2020.

