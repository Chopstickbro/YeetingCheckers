/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module led_multiplexer_2 (
    input clk,
    input rst,
    output reg [5:0] row,
    output reg [5:0] column,
    input [35:0] inp_int,
    output reg timerout
  );
  
  
  
  localparam N = 5'h11;
  
  reg [16:0] M_timer_d, M_timer_q = 1'h0;
  
  
  localparam ONE_column_sel = 3'd0;
  localparam TWO_column_sel = 3'd1;
  localparam THREE_column_sel = 3'd2;
  localparam FOUR_column_sel = 3'd3;
  localparam FIVE_column_sel = 3'd4;
  localparam SIX_column_sel = 3'd5;
  
  reg [2:0] M_column_sel_d, M_column_sel_q = ONE_column_sel;
  
  always @* begin
    M_column_sel_d = M_column_sel_q;
    M_timer_d = M_timer_q;
    
    timerout = M_timer_q[16+0-:1];
    row = 8'h00;
    column = 8'h00;
    
    case (M_column_sel_q)
      ONE_column_sel: begin
        row[0+0-:1] = 1'h1;
        column = ~inp_int[0+5-:6];
        M_column_sel_d = TWO_column_sel;
      end
      TWO_column_sel: begin
        row[1+0-:1] = 1'h1;
        column = ~inp_int[6+5-:6];
        M_column_sel_d = THREE_column_sel;
      end
      THREE_column_sel: begin
        row[2+0-:1] = 1'h1;
        column = ~inp_int[12+5-:6];
        M_column_sel_d = FOUR_column_sel;
      end
      FOUR_column_sel: begin
        row[3+0-:1] = 1'h1;
        column = ~inp_int[18+5-:6];
        M_column_sel_d = FIVE_column_sel;
      end
      FIVE_column_sel: begin
        row[4+0-:1] = 1'h1;
        column = ~inp_int[24+5-:6];
        M_column_sel_d = SIX_column_sel;
      end
      SIX_column_sel: begin
        row[5+0-:1] = 1'h1;
        column = ~inp_int[30+5-:6];
        M_column_sel_d = ONE_column_sel;
      end
    endcase
    M_timer_d = M_timer_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_timer_q <= 1'h0;
    end else begin
      M_timer_q <= M_timer_d;
    end
  end
  
  
  always @(posedge M_timer_q[16+0-:1]) begin
    if (rst == 1'b1) begin
      M_column_sel_q <= 1'h0;
    end else begin
      M_column_sel_q <= M_column_sel_d;
    end
  end
  
endmodule
