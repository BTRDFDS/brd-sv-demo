class HelloWorld;
    function void print_hello();
        $display("Hello World from a SystemVerilog Class!");
    endfunction
    function new();
        $display("The helloworld class is ready");
    endfunction
endclass

module hw ();
	initial begin
        HelloWorld hw = new();
        hw.print_hello();
		#10 $display("%t hello world",$time);
		#10 $display("%t %d",$time,$random);
		repeat(5) #10 $display("%t repeat 5",$time);
		for(int i=0;i<5;i++)#3$display("%t for %d",$time,i); 
		$finish();
	end
    logic clk=0;
    initial forever #5 clk = ~clk;

    always_ff@(posedge clk)begin
		$display("%t clk time",$time);
    end
endmodule
