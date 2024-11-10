// up_counter rtl

module up_counter(out,clk,rst_h);

	input clk,rst_h;
	output reg [3:0]out;

	always@(posedge clk or posedge rst_h)
		begin 
			if(rst_h==1)
				out<=8'b0;
			else
				out<=out+1;
		end
endmodule	
