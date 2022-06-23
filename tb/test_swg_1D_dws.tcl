##############################################################################
 #  Copyright (c) 2021, Xilinx, Inc.
 #  Copyright (c) 2022, Advanced Micro Devices, Inc.
 #  All rights reserved.
 #
 #  Redistribution and use in source and binary forms, with or without
 #  modification, are permitted provided that the following conditions are met:
 #
 #  1.  Redistributions of source code must retain the above copyright notice,
 #     this list of conditions and the following disclaimer.
 #
 #  2.  Redistributions in binary form must reproduce the above copyright
 #      notice, this list of conditions and the following disclaimer in the
 #      documentation and/or other materials provided with the distribution.
 #
 #  3.  Neither the name of the copyright holder nor the names of its
 #      contributors may be used to endorse or promote products derived from
 #      this software without specific prior written permission.
 #
 #  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 #  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 #  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 #  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 #  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 #  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 #  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 #  OR BUSINESS INTERRUPTION). HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 #  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 #  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 #  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 #
###############################################################################
###############################################################################
 #
 #  Authors: Mirza Mrahorovic <mirzam@xilinx.com>
 #
 # \file test_swg_1D_dws.tcl
 #
 # Tcl script for HLS csim, synthesis and cosim of the sliding window generator block for 1D depthwise separable convolutions
 #
###############################################################################
open_project hls-syn-swg-1d-dws
add_files input_gen_1D_dws.cpp -cflags "-std=c++14 -I$::env(FINN_HLS_ROOT)"
add_files -tb swg_1D_dws_tb.cpp -cflags "-std=c++14 -I$::env(FINN_HLS_ROOT)"
set_top Testbench
open_solution sol1
set_part {xczu3eg-sbva484-1-i}
create_clock -period 5 -name default
csim_design
csynth_design
cosim_design
exit
