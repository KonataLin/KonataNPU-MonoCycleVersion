// DESCRIPTION: The example for test on verilator
//======================================================================

#include <verilated.h>
#include "Vcpu.h"

static void single_cycle(Vcpu* cpu) {
    cpu -> clock = 1; cpu -> eval();
  
    cpu -> clock = 0; cpu -> eval();
}

static void reset(int n, Vcpu* cpu) {
    cpu -> reset = 1;
  
    while (n -- > 0) single_cycle(cpu);
    cpu -> reset = 0;
  
}

//ebreak will be called through DPI-C to here
extern "C" void ebreak(){
    printf("[Info] Hit ebreak instruction...Good Bye!\n");
  
    exit(0);
}
  
int main(int argc, char** argv) {
    VerilatedContext* contextp = new VerilatedContext;
  
    contextp -> commandArgs(argc, argv);
  
    Vcpu* cpu = new Vcpu{contextp};
  
	  printf("[Info] Reseting cpu\n");
  
    reset(10, cpu);
  
    cpu -> io_inst = 0b00000000001100001000000010010011;
  
    while (!contextp->gotFinish()) {
	cpu -> io_inst = 0b00000000001100001000000010010011;  //addi instruction at here
        single_cycle(cpu);
	    
        cpu -> io_inst = 0b00000000000100000000000001110011;  //ebreak instruction at here
        single_cycle(cpu);
    }
  
    cpu -> final();
  
    delete cpu;
  
    return 0;
}
