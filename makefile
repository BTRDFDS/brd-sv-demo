hw:
	verilator helloworld.sv --Mdir build/helloworld --binary --timing --timescale "1ms/1ms"
	./build/helloworld/Vhelloworld
