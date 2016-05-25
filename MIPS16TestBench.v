/*
	Leave the tb_CPU unchanged, 
	you should not have to change anything here.
*/

module tb_CPU; 
	reg clk;
 	reg rst;

	CPU U0
	(
		.clk(clk),
		.rst(rst)
	);

	always 
		#5 clk = ~clk;
	
	initial
	begin

		// time = 0	
		clk = 1'b0;
		// Reset CPU
		rst = 1'b1;
		// run 1st iteration to reset cpu, and load first instruction
		@(posedge clk);
		
		// set Rest to 0
		rst = 1'b0;
		
		// Run through 5 CPU cycles
		repeat(5)
			@(posedge clk);
			
		$finish();
	end

endmodule
