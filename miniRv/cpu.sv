class Cpu;
	function void print_hello();
		$display("Hello World from a SystemVerilog Class!");
	endfunction
	function void step(logic [7:0] instr);
		case(instr)inside
			8'b10??????:$display("111");
			8'b11??????:$display("222");
			default:$display("333");
		endcase
	endfunction
	function new();
		$display("The cpu class is ready");
	endfunction
endclass

module top ();
	initial begin
		Cpu cpu = new();
		cpu.print_hello();
		#10 $display("%t hello world",$time);
		#10 cpu.step(8'b11000000);
		#10 cpu.step(8'b10000000);
		#10 cpu.step(8'b01000000);
		#10 cpu.step(8'b00000000);
		$finish();
	end
endmodule
