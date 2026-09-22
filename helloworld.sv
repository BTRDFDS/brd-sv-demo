class HelloWorld;
    function void print_hello();
        $display("Hello World from a SystemVerilog Class!");
    endfunction
endclass

module top ();
	initial begin
        HelloWorld hw = new();
        hw.print_hello();
		#10 $display("%t hello world",$time);
		#10 $display("%t %d",$time,$random);
		repeat(5) #10 $display("%t repeat 5",$time);
		for(int i=0;i<5;i++)$display("%t for %d",$time,i); 
		$finish();
	end
endmodule