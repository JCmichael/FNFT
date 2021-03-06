/*
 * This file is part of FNFT.
 *
 * FNFT is free software; you can redistribute it and/or
 * modify it under the terms of the version 2 of the GNU General
 * Public License as published by the Free Software Foundation.
 *
 * FNFT is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 * Contributors:
 * Sander Wahls (TU Delft) 2018.
 */

#include "fnft_nsev_inverse_test_B_of_tau_or_b_of_xi_w_discrete.inc"

int main()
{
    INT ret_code = SUCCESS;

    fnft_nsev_inverse_opts_t opts = fnft_nsev_inverse_default_opts();
    opts.discretization = nse_discretization_2SPLIT2A;
    opts.contspec_type = fnft_nsev_inverse_cstype_B_OF_TAU;

    UINT D = 512;
    REAL error_bound = 0.00063;
    for (UINT i=0; i<4; i++) {
        ret_code = fnft_nsev_inverse_test(D, D, error_bound, &opts);
        CHECK_RETCODE(ret_code, leave_fun);
        D *= 2;
        error_bound /= 4;
    }

leave_fun:
    if (ret_code == SUCCESS)
        return EXIT_SUCCESS;
    else
        return EXIT_FAILURE;
}
