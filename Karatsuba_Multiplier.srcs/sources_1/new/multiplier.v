`timescale 1ns / 1ps

module multiplier(
    input[162:0] A,B,
    output[162:0] out
 );
 wire[81:0] Alo,Blo;
 wire[80:0] Ahi,Bhi;
 wire[162:0] p1,p2,p3;
 wire[324:0] t1,t2,t3,unmod_out;

assign Alo=A[81:0];
assign Ahi=A[162:82];
assign Blo=B[81:0];
assign Bhi=B[162:82];

km_81 P1 (.A({1'b0,Ahi}),.B({1'b0,Bhi}),.out(p1));
km_81 P2 (.A(Alo),.B(Blo),.out(p2));
km_81 P3 (.A({1'b0,Ahi}^Alo),.B({1'b0,Bhi}^Blo),.out(p3));

assign t1={p1[160:0],{164{1'b0}}};
assign t2={{162{1'b0}},p2};
assign t3={{80{1'b0}},p3^p2^p1,{82{1'b0}}};

assign unmod_out=t1^t2^t3;
mod m1 (.in(unmod_out),.out(out));
endmodule
