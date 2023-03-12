`timescale 1ns / 1ps

module km_81(
    input[81:0] A,B,
    output[162:0] out
 );
 wire[40:0] Alo,Blo;
 wire[40:0] Ahi,Bhi;
 wire[80:0] p1,p2,p3;
 wire[162:0] t1,t2,t3;

assign Alo=A[40:0];
assign Ahi=A[81:41];
assign Blo=B[40:0];
assign Bhi=B[81:41];

km_40 P1 (.A(Ahi),.B(Bhi),.out(p1));
km_40 P2 (.A(Alo),.B(Blo),.out(p2));
km_40 P3 (.A(Ahi^Alo),.B(Bhi^Blo),.out(p3));

assign t1={p1,{82{1'b0}}};
assign t2={{82{1'b0}},p2};
assign t3={{41{1'b0}},p3^p2^p1,{41{1'b0}}};

assign out=t1^t2^t3;
endmodule
