`timescale 1ns / 1ps
module km_40(
    input[40:0] A,B,
    output[80:0] out
 );
 wire[20:0] Alo,Blo;
 wire[19:0] Ahi,Bhi;
 wire[40:0] p1,p2,p3;
 wire[80:0] t1,t2,t3;

assign Alo=A[20:0];
assign Ahi=A[40:21];
assign Blo=B[20:0];
assign Bhi=B[40:21];

km_20 P1 (.A({1'b0,Ahi}),.B({1'b0,Bhi}),.out(p1));
km_20 P2 (.A(Alo),.B(Blo),.out(p2));
km_20 P3 (.A({1'b0,Ahi}^Alo),.B({1'b0,Bhi}^Blo),.out(p3));

assign t1={p1[38:0],{42{1'b0}}};
assign t2={{40{1'b0}},p2};
assign t3={{19{1'b0}},p3^p2^p1,{21{1'b0}}};

assign out=t1^t2^t3;
endmodule
