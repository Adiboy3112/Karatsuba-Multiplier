`timescale 1ns / 1ps
module km_5(
    input[5:0] A,B,
    output[10:0] out
 );
 wire[2:0] Alo,Blo;
 wire[2:0] Ahi,Bhi;
 wire[4:0] p1,p2,p3;
 wire[10:0] t1,t2,t3;

assign Alo=A[2:0];
assign Ahi=A[5:3];
assign Blo=B[2:0];
assign Bhi=B[5:3];

km_2 P1 (.A(Ahi),.B(Bhi),.out(p1));
km_2 P2 (.A(Alo),.B(Blo),.out(p2));
km_2 P3 (.A(Ahi^Alo),.B(Bhi^Blo),.out(p3));

assign t1={p1,{6{1'b0}}};
assign t2={{6{1'b0}},p2};
assign t3={{3{1'b0}},p3^p2^p1,{3{1'b0}}};

assign out=t1^t2^t3;
endmodule
