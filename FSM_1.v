module fsm (
  input clk,
  input reset,
  input [4:0] pin,
  input valid,
  input [7:0] amount,
  output reg [31:0] state
);

  always @(posedge clk) begin
    if (reset) begin
      state <= 4'b0000;
    end else begin
      case (state)
        4'b0000: begin
          if (pin == 5'd1234) begin
            state <= 4'b0001;
          end else begin
            state <= 4'b0000;
          end
        end
        4'b0001: begin
          if (valid) begin
            state <= 4'b0010;
          end else begin
            state <= 4'b0001;
          end
        end
        4'b0010: begin
          if (amount == 8'd100) begin
            state <= 4'b0011;
          end else begin
            state <= 4'b0010;
          end
        end
        4'b0011: begin
          state <= 4'b0000;
        end
      endcase
    end
  end

endmodule
