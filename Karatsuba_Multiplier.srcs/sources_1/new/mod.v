`timescale 1ns / 1ps
module mod(
    input[324:0] in,
    output[162:0] out
    );
    wire[241:0] b,c,d,e,round1_mod;
    wire[162:0] a,f,g,h,i,j;
   assign a=in[162:0];
   
   
   assign b={in[324:163],{80{1'b0}}};
   assign c={{33{1'b0}},in[324:163],{47{1'b0}}};
   assign d={{71{1'b0}},in[324:163],{9{1'b0}}};
   assign e={{80{1'b0}},in[324:163]};
   
   assign round1_mod=b^c^d^e;
   
  
   assign f={{4{1'b0}},round1_mod[241:163],{80{1'b0}}};
   assign g={{37{1'b0}},round1_mod[241:163],{47{1'b0}}};
   assign h={{75{1'b0}},round1_mod[241:163],{9{1'b0}}};
   assign i={{84{1'b0}},round1_mod[241:163]};
   assign j=round1_mod[162:0];
   
   assign out=a^f^g^h^i^j;
   
   
    
endmodule
