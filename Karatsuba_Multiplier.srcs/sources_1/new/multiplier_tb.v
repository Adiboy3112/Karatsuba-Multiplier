`timescale 1ns/1ps
module multiplier_tb;

  // Parameters
  parameter WIDTH = 163;
  parameter NUM_TESTS = 5;

  // Inputs
  reg [WIDTH-1:0] A;
  reg [WIDTH-1:0] B;
  reg[WIDTH-1:0] expected_out;

  // Outputs
  wire [WIDTH-1:0] out;

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
          A = 4;
          B = 4;
          expected_out = 16;
        end
        1: begin
          A = 11;
          B = 11;
          expected_out =69;
        end
        2: begin
          A = 163'h8000000000000000000000000000000000000001;
          B = 163'h8000000000000000000000000000000000000001;
          expected_out=163'h00900000000000000004001000000008000000403;
        end
        3: begin
          A = 163'h7ffffffffffffffffffffffffffffffffffffffff;
          B = 163'h7ffffffffffffffffffffffffffffffffffffffff;
          expected_out=163'h500000000000000001555ffffffffaaaaaaabfeaa;
        end
        4: begin
          A = 163'h810000000000000000000000000000000000001;
          B = 163'h820000000000000000000000000000000000001;
          expected_out = 163'h01059b648000000000000438f160801068b040001;
        end
        default: begin
          $error("Invalid test case index: %d", i);
        end
      endcase

      // Wait for 10 time units
      #10;

      // Display input values and output value
      $display("Test %d: A = %h, B = %h, expected_out = %h, out = %h", i, A, B, expected_out, out);

      // Compare the output to the expected value
      if (out !== expected_out) begin
        $error("Test %d failed: expected_out = %h, out = %h", i, expected_out, out);
      end
    end

    // End simulation
    #10;
    $finish;
  end

  // Apply clock
  always #1 clk = !clk;

endmodule
