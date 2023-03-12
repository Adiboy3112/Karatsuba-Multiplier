`timescale 1ns / 1ps

module km_1(
 input[1:0] A,B,
 output[2:0] out
);

    assign out[0]= A[0]&B[0];
    assign out[1]= (A[1]&B[0])^(A[0]&B[1]);
    assign out[2]= (A[1]&B[1]);
   
endmodule
