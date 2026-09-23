build:
	mkdir build
run:build
	verilator cpu.sv --Mdir build/cpu --binary --timing --timescale "1ms/1ms"
	./build/cpu/Vcpu
