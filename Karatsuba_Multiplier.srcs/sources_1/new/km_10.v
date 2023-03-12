`timescale 1ns / 1ps
module km_10(
    input[10:0] A,B,
    output[20:0] out
 );
 wire[5:0] Alo,Blo;
 wire[4:0] Ahi,Bhi;
 wire[10:0] p1,p2,p3;
 wire[20:0] t1,t2,t3;

assign Alo=A[5:0];
assign Ahi=A[10:6];
assign Blo=B[5:0];
assign Bhi=B[10:6];

km_5 P1 (.A({1'b0,Ahi}),.B({1'b0,Bhi}),.out(p1));
km_5 P2 (.A(Alo),.B(Blo),.out(p2));
km_5 P3 (.A({1'b0,Ahi}^Alo),.B({1'b0,Bhi}^Blo),.out(p3));

assign t1={p1[8:0],{12{1'b0}}};
assign t2={{10{1'b0}},p2};
assign t3={{4{1'b0}},p3^p2^p1,{6{1'b0}}};

assign out=t1^t2^t3;
endmodule
