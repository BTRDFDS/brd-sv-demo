hw:
	verilator helloworld.sv --Mdir build/helloworld --binary --timing
	./build/helloworld/Vhelloworld
