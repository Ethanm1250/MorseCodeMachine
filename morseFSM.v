`timescale 1ns / 1ps
//`define DOT 2'b01
//`define DASH 2'b10
//`define SEND 2'b11
//`define SPACE 3'h4

module morseFSM ( 
  input [1:0] inputSignal, // dot, dash, or space
  input reset,
  input clk,
  output reg [7:0] letter, 
  output reg done 
);
  
  reg [5:0] state;
  
  localparam start = 0,
             A = 1,
             B = 2,
             C = 3,
             D = 4,
             E = 5,
             F = 6,
             G = 7,
             H = 8,
             I = 9,
             J = 10,
             K = 11,
             L = 12,
             M = 13,
             N = 14,
             O = 15,
             P = 16,
             Q = 17,
             R = 18,
             S = 19,
             T = 20,
             U = 21,
             V = 22,
             W = 23,
             X = 24,
             Y = 25,
             Z = 26,
             space = 27;
  
  initial begin
      state = start;
      letter = 8'b0;
  end

  always @ (posedge clk) begin
    if (inputSignal == 2'b11) begin
        state <= start;
      end
    if (inputSignal == 2'b00) begin
        state <= state;
    end
    if (reset) begin
        state <= start;
    end
    //if (state == start && inputSignal == `SPACE) begin
    //  	state <= space;
    //  end
   // if (state != start && inputSignal == `SPACE) begin
    //   state <= state;
    // end
      if (state == space) begin
      	state <= start;
      end
    if (state == start && inputSignal == 2'b01) begin
        state <= E;
      end
    if (state == start && inputSignal == 2'b10) begin
        state <= T;
      end

    if (state == E && inputSignal == 2'b01) begin
        state <= I;
      end
    if (state == E && inputSignal == 2'b10) begin
        state <= A;
      end

    if (state == T && inputSignal == 2'b01) begin
        state <= N;
      end
    if (state == T && inputSignal == 2'b10) begin
        state <= M;
      end

    if (state == I && inputSignal == 2'b01) begin
        state <= S;
      end
    if (state == I && inputSignal == 2'b10) begin
        state <= U;
      end

    if (state == A && inputSignal == 2'b01) begin
        state <= R;
      end
    if (state == A && inputSignal == 2'b10) begin
        state <= W;
      end

    if (state == N && inputSignal == 2'b01) begin
        state <= D;
      end
    if (state == N && inputSignal == 2'b10) begin
        state <= K;
      end

    if (state == M && inputSignal == 2'b01) begin
        state <= G;
      end
    if (state == M && inputSignal == 2'b10) begin
        state <= O;
      end

    if (state == S && inputSignal == 2'b01) begin
        state <= H;
      end
    if (state == S && inputSignal == 2'b10) begin
        state <= V;
      end

    if (state == U && inputSignal == 2'b01) begin
        state <= F;
      end

    if (state == R && inputSignal == 2'b01) begin
        state <= L;
      end

    if (state == W && inputSignal == 2'b10) begin
        state <= P;
      end
    if (state == W && inputSignal == 2'b10) begin
        state <= J;
      end

    if (state == D && inputSignal == 2'b01) begin
        state <= B;
      end
    if (state == D && inputSignal == 2'b10) begin
        state <= X;
      end

    if (state == K && inputSignal == 2'b01) begin
        state <= C;
      end
    if (state == K && inputSignal == 2'b10) begin
        state <= Y;
      end

    if (state == G && inputSignal == 2'b01) begin
        state <= Z;
      end
    if (state == G && inputSignal == 2'b10) begin
        state <= Q;
      end
  end

  always @( state ) begin
      case (state)
        start: begin done = 1; letter = 0; end
        A: begin done = 0; letter = 65; end
        B: begin done = 0; letter = 66; end
        C: begin done = 0; letter = 67; end
        D: begin done = 0; letter = 68; end
        E: begin done = 0; letter = 69; end
        F: begin done = 0; letter = 70; end
        G: begin done = 0; letter = 71; end
        H: begin done = 0; letter = 72; end
        I: begin done = 0; letter = 73; end
        J: begin done = 0; letter = 74; end
        K: begin done = 0; letter = 75; end
        L: begin done = 0; letter = 76; end
        M: begin done = 0; letter = 77; end
        N: begin done = 0; letter = 78; end
        O: begin done = 0; letter = 79; end
        P: begin done = 0; letter = 80; end
        Q: begin done = 0; letter = 81; end
        R: begin done = 0; letter = 82; end
        S: begin done = 0; letter = 83; end
        T: begin done = 0; letter = 84; end
        U: begin done = 0; letter = 85; end
        V: begin done = 0; letter = 86; end
        W: begin done = 0; letter = 87; end
        X: begin done = 0; letter = 88; end
        Y: begin done = 0; letter = 89; end
        Z: begin done = 0; letter = 90; end
        space: begin done = 0; letter = 32; end
      endcase
  end
endmodule
