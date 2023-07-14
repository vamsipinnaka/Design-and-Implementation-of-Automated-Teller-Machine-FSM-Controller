module fsm_tb;

  reg clk;
  reg reset;
  reg [4:0] pin;
  reg valid;
  reg [7:0] amount;
  wire [31:0] state;

  // Instantiate the FSM module
  fsm dut (
    .clk(clk),
    .reset(reset),
    .pin(pin),
    .valid(valid),
    .amount(amount),
    .state(state)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial begin
    // Initialize inputs
    clk = 0;
    reset = 0;
    pin = 0;
    valid = 0;
    amount = 0;

    // Reset FSM
    reset = 1;
    #10 reset = 0;

    // Test case 1: Valid PIN
    pin = 5'b11010;
    valid = 1;
    #20 valid = 0;

    // Test case 2: Invalid PIN
    pin = 5'b00111;
    #20;

    // Test case 3: Valid PIN, invalid amount
    pin = 5'b11010;
    valid = 1;
    amount = 8'b01010101;
    #20 amount = 8'b01100110;

    // Test case 4: Valid PIN, valid amount
    pin = 5'b11010;
    valid = 1;
    amount = 8'b01100110;
    #20;

    // End simulation
    $finish;
  end

endmodule
