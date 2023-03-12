`timescale 1ns / 1ps
module km_20(
    input[20:0] A,B,
    output[40:0] out
 );
 wire[10:0] Alo,Blo;
 wire[9:0] Ahi,Bhi;
 wire[20:0] p1,p2,p3;
 wire[40:0] t1,t2,t3;

assign Alo=A[10:0];
assign Ahi=A[20:11];
assign Blo=B[10:0];
assign Bhi=B[20:11];

km_10 P1 (.A({1'b0,Ahi}),.B({1'b0,Bhi}),.out(p1));
km_10 P2 (.A(Alo),.B(Blo),.out(p2));
km_10 P3 (.A({1'b0,Ahi}^Alo),.B({1'b0,Bhi}^Blo),.out(p3));

assign t1={p1[18:0],{22{1'b0}}};
assign t2={{20{1'b0}},p2};
assign t3={{9{1'b0}},p3^p2^p1,{11{1'b0}}};

assign out=t1^t2^t3;
endmodule
