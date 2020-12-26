module enco(a,b,s0,s1,s2,s3,clk);
input wire a,b;
input wire clk;
output reg s0,s1,s2,s3;
always @(posedge clk)
begin
case({a,b})
{1'b0,1'b0}: begin
s0=1'b1;
s1=1'b0;
s2=1'b0;
s3=1'b0;
end
{1'b0,1'b1}: begin
s0=1'b0;
s1=1'b1;
s2=1'b0;
s3=1'b0;
end
{1'b1,1'b0}: begin
s0=1'b0;
s1=1'b0;
s2=1'b1;
s3=1'b0;
end
{1'b1,1'b1}: begin
s0=1'b0;
s1=1'b0;
s2=1'b0;
s3=1'b1;
end
endcase
end
endmodule 

module test_enco;
reg A,B;
reg clk;
wire S0,S1,S2,S3;

enco enc(.a(A),.b(B),.clk(clk),.s0(S0),.s1(S1),.s2(S2),.s3(S3));

initial begin
 
$monitor(S0,S1,S2,S3);
clk=1; 
A=0;B=1;

#20
A=1;
B=1;
#200

A=0;
B=0;
#200

A=1;
B=0;
$display(S0,S1,S2,S3,clk);
end
always 
begin
#25 clk <= ~clk;
end

endmodule
