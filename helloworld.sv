module top ();
	initial begin
		$display("hello world");
		#10 $display("hello world");
		#10 $display("hello world");
		#10 $display("hello world");
		#10 $display("hello world");
		$finish();
	end
endmodule