build:
	mkdir build
hw:build
	verilator hw.sv --Mdir build/hw --binary --timing --timescale "1ms/1ms"
	./build/hw/Vhw
