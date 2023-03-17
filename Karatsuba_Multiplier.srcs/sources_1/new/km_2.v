`timescale 1ns / 1ps
module km_2(
    input[2:0] A,B,
    output[4:0] out
 );
 wire[1:0] Alo,Blo;
 wire Ahi,Bhi;
 wire[2:0] p1,p2,p3;
 wire[4:0] t1,t2,t3;

assign Alo=A[1:0];
assign Ahi=A[2];
assign Blo=B[1:0];
assign Bhi=B[2];

km_1 P1 (.A({1'b0,Ahi}),.B({1'b0,Bhi}),.out(p1));
km_1 P2 (.A(Alo),.B(Blo),.out(p2));
km_1 P3 (.A({1'b0,Ahi}^Alo),.B({1'b0,Bhi}^Blo),.out(p3));

assign t1={p1[0],{4{1'b0}}};
assign t2={{2{1'b0}},p2};
assign t3={p3^p2^p1,{2{1'b0}}};

assign out=t1^t2^t3;
endmodule
