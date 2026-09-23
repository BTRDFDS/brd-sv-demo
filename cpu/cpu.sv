class Cpu;
	logic [4:0] rd,r1,r2;
	logic [31:0] immU,immJ,immI,immB,immS;
	function void print_hello();
		$display("Hello World from a SystemVerilog Class!");
	endfunction
	function logic [31:0] gprRead(logic[6:0] addr);
		return 0;
	endfunction
	function void step(logic [31:0] instr);
		r2=instr[24:20];
		r1=instr[19:15];
		rd=instr[11: 7];
		immU=0;
		case(instr)inside
			32'b???????_?????_?????_???_?????_0110111:begin end
			default:$display("unknow");
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
		#10 cpu.step(32'b00000000);
		$finish();
	end
endmodule
