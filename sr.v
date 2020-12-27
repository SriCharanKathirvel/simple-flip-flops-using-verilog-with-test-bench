module srff(s,r,clk,q,qb);

input s,r,clk;
output reg q,qb;

always @(posedge clk) begin

case({s,r})
  {1'b0,1'b0}:begin q=q;qb=qb;end
  {1'b0,1'b1}:begin q=0;qb=1;end
  {1'b1,1'b0}:begin q=1;qb=0;end
  {1'b0,1'b0}:begin q=0;qb=0;end
endcase
end
endmodule

module testsr;

reg S,R,CLK;
wire Q,QB;
srff testff(.clk(CLK),.s(S),.r(R),.q(Q),.qb(QB));
initial begin
$monitor(CLK,S,R,Q,QB);
 $display(CLK,S,R,Q);
S= 1'b0;
R= 1'b0;
CLK=1;
 
#10

S= 1'b0;
R= 1'b1;
 
#100
S= 1'b0;
R= 1'b0;
 
#100
S= 1'b1;
R= 1'b1;
 
#100
S= 1'b1;
R= 1'b0;
 

 
end
always #25 CLK <= ~CLK;
 
endmodule
