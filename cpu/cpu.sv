class Cpu;
	logic [4:0] rd,r1,r2;
	logic [31:0] immU,immJ,immI,immB,immS;
	logic [31:0] pc,dnpc;
	function void print_hello();
		$display("Hello World from a SystemVerilog Class!");
	endfunction
	function logic [31:0] gprRead(logic[4:0] addr);
		return 0;
	endfunction
	function void gprWrite(logic[4:0] addr,logic[31:0] data);
		
	endfunction
	function logic [31:0] memRead(logic[31:0] addr);
		
	endfunction
	function void memWrite(logic[31:0] addr,logic[31:0] data,logic[3:0] mask);
		
	endfunction
	function void printLog(string message);		
	endfunction
	function void step(logic [31:0] instr);
		r2=instr[24:20];
		r1=instr[19:15];
		rd=instr[11: 7];
		// (opEnum === Op.Icsr)	-> in.imme.csrOut,
		immU={instr[31:12],12'b0};
		immJ={{12{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};
		immB={{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};
		immS={{20{instr[31]}},instr[31:25],instr[11:7]};
		immI={{20{instr[31]}},instr[31:20]};
		case(instr)inside
			32'b???????_?????_?????_???_?????_0110111:begin printLog($sformatf("lui %x,%x",rd,immU));		gprWrite(rd,immU);end
			32'b???????_?????_?????_???_?????_0010111:begin printLog($sformatf("auipc %x,%x",rd,immU));		gprWrite(rd,pc+immU);end
			32'b???????_?????_?????_???_?????_1101111:begin printLog($sformatf("jal %x,%x",rd,immJ));		gprWrite(rd,pc+4);dnpc=immJ+pc;end
			32'b???????_?????_?????_000_?????_1100111:begin printLog($sformatf("jalr %x,%x,%x",rd,r1,immI));gprWrite(rd,pc+4);dnpc=immI+gprRead(r1);end
			32'b???????_?????_?????_000_?????_1100011:begin printLog($sformatf("beq %x,%x,%x",r1,r2,immB));	dnpc=((gprRead(r1)==gprRead(r2))?immB:pc+4);end
			32'b???????_?????_?????_001_?????_1100011:begin printLog($sformatf("bne %x,%x,%x",r1,r2,immB));	dnpc=((gprRead(r1)!=gprRead(r2))?immB:pc+4);end
			32'b???????_?????_?????_100_?????_1100011:begin printLog($sformatf("blt %x,%x,%x",r1,r2,immB));	dnpc=((  $signed(gprRead(r1))<   $signed(gprRead(r2)))?immB:pc+4);end
			32'b???????_?????_?????_101_?????_1100011:begin printLog($sformatf("bge %x,%x,%x",r1,r2,immB));	dnpc=((  $signed(gprRead(r1))>=  $signed(gprRead(r2)))?immB:pc+4);end
			32'b???????_?????_?????_110_?????_1100011:begin printLog($sformatf("bltu %x,%x,%x",r1,r2,immB));dnpc=(($unsigned(gprRead(r1))< $unsigned(gprRead(r2)))?immB:pc+4);end
			32'b???????_?????_?????_111_?????_1100011:begin printLog($sformatf("bgeu %x,%x,%x",r1,r2,immB));dnpc=(($unsigned(gprRead(r1))>=$unsigned(gprRead(r2)))?immB:pc+4);end
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
