/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns / 1ps

module tt_um_gmejiamtz (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings

  //just instantiate sdram
  sdram_controller controller (.clock(clk),.reset(!rst_n),.io_read_row_addresses_0('0),.io_read_col_addresses_0('0),.io_read_data_valid_0(),.io_read_start_0('0),.io_write_row_addresses_0('0),.io_write_col_addresses_0('0),.io_write_data_valid_0(),.io_write_start_0(),.io_sdram_control_cs(),.io_sdram_control_ras(),.io_sdram_control_cas(),.io_sdram_control_we(),.io_sdram_control_address_bus(),.io_state_out());
endmodule
