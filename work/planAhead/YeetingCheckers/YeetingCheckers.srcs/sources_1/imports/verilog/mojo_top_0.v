/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [5:0] row,
    output reg [5:0] col,
    input [5:0] buttoncol,
    input [5:0] buttonrow
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [6-1:0] M_led_multiplexer_row;
  wire [6-1:0] M_led_multiplexer_column;
  wire [1-1:0] M_led_multiplexer_timerout;
  reg [36-1:0] M_led_multiplexer_inp_int;
  led_multiplexer_2 led_multiplexer (
    .clk(clk),
    .rst(rst),
    .inp_int(M_led_multiplexer_inp_int),
    .row(M_led_multiplexer_row),
    .column(M_led_multiplexer_column),
    .timerout(M_led_multiplexer_timerout)
  );
  
  wire [3-1:0] M_button_sensing_a_row;
  wire [3-1:0] M_button_sensing_a_col;
  wire [3-1:0] M_button_sensing_b_row;
  wire [3-1:0] M_button_sensing_b_col;
  wire [1-1:0] M_button_sensing_read;
  reg [6-1:0] M_button_sensing_buttonrow;
  reg [6-1:0] M_button_sensing_buttoncol;
  button_sensing_3 button_sensing (
    .clk(clk),
    .rst(rst),
    .buttonrow(M_button_sensing_buttonrow),
    .buttoncol(M_button_sensing_buttoncol),
    .a_row(M_button_sensing_a_row),
    .a_col(M_button_sensing_a_col),
    .b_row(M_button_sensing_b_row),
    .b_col(M_button_sensing_b_col),
    .read(M_button_sensing_read)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_button_sensing_buttoncol = buttoncol;
    M_button_sensing_buttonrow = buttonrow;
    M_led_multiplexer_inp_int[0+5-:6] = M_button_sensing_a_col;
    M_led_multiplexer_inp_int[6+5-:6] = M_button_sensing_a_row;
    M_led_multiplexer_inp_int[12+5-:6] = buttoncol;
    M_led_multiplexer_inp_int[18+5-:6] = 6'h3f;
    M_led_multiplexer_inp_int[24+5-:6] = M_button_sensing_b_col;
    M_led_multiplexer_inp_int[30+5-:6] = M_button_sensing_b_row;
    row = M_led_multiplexer_row;
    col = M_led_multiplexer_column;
    led[0+0-:1] = M_led_multiplexer_timerout;
  end
endmodule
