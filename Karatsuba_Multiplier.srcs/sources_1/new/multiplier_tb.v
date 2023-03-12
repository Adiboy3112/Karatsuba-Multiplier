`timescale 1ns/1ps
module multiplier_tb;

  // Parameters
  parameter WIDTH = 163;
  parameter NUM_TESTS = 5;

  // Inputs
  reg [WIDTH-1:0] A;
  reg [WIDTH-1:0] B;
  reg[2*WIDTH-1:0] expected_out;

  // Outputs
  wire [2*WIDTH-2:0] out;

  // Instantiate the DUT
  multiplier dut (
    .A(A),
    .B(B),
    .out(out)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = !clk;
  integer i;
  // Stimulus
  initial begin
    for (i = 0; i < NUM_TESTS; i=i+1) begin
      // Generate test inputs and expected output
      
      case (i)
        0: begin
          A = 0;
          B = 0;
          expected_out = 0;
        end
        1: begin
          A = 2;
          B = 1;
          expected_out = A * B;
        end
        2: begin
          A = 11;
          B = 11;
          expected_out = A * B;
        end
        3: begin
          A = 1;
          B = (2**WIDTH)-1;
          expected_out = A * B;
        end
        4: begin
          A = (2**WIDTH-1);
          B = 1;
          expected_out = A * B;
        end
        default: begin
          $error("Invalid test case index: %d", i);
        end
      endcase

      // Wait for 10 time units
      #10;

      // Display input values and output value
      $display("Test %d: A = %b, B = %b, expected_out = %b, out = %b", i, A, B, expected_out, out);

      // Compare the output to the expected value
      if (out !== expected_out) begin
        $error("Test %d failed: expected_out = %b, out = %b", i, expected_out, out);
      end
    end

    // End simulation
    #10;
    $finish;
  end

  // Apply clock
  always #1 clk = !clk;

endmodule
