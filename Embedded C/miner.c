
#include <stdio.h>
#include "platform.h"
#include "miner.h"

#define base_address 0x7E400000
#define check_bit(var,pos) ((var) & (1<<(pos)))

void set_data(u32 data0, u32 data1, u32 data2) {
	//Data
	MINER_mWriteReg(base_address, MINER_SLV_REG0_OFFSET, data0);
	MINER_mWriteReg(base_address, MINER_SLV_REG1_OFFSET, data1);
	MINER_mWriteReg(base_address, MINER_SLV_REG2_OFFSET, data2);
}

void set_midstate(u32 midstate0, u32 midstate1, u32 midstate2, u32 midstate3, u32 midstate4, u32 midstate5, u32 midstate6, u32 midstate7) {
	//Midstate
	MINER_mWriteReg(base_address, MINER_SLV_REG3_OFFSET, midstate0);
	MINER_mWriteReg(base_address, MINER_SLV_REG4_OFFSET, midstate1);
	MINER_mWriteReg(base_address, MINER_SLV_REG5_OFFSET, midstate2);
	MINER_mWriteReg(base_address, MINER_SLV_REG6_OFFSET, midstate3);
	MINER_mWriteReg(base_address, MINER_SLV_REG7_OFFSET, midstate4);
	MINER_mWriteReg(base_address, MINER_SLV_REG8_OFFSET, midstate5);
	MINER_mWriteReg(base_address, MINER_SLV_REG9_OFFSET, midstate6);
	MINER_mWriteReg(base_address, MINER_SLV_REG10_OFFSET, midstate7);
}

void set_target(u32 target0, u32 target1, u32 target2, u32 target3, u32 target4, u32 target5, u32 target6, u32 target7) {
	//Target
	MINER_mWriteReg(base_address, MINER_SLV_REG11_OFFSET, target0);
	MINER_mWriteReg(base_address, MINER_SLV_REG12_OFFSET, target1);
	MINER_mWriteReg(base_address, MINER_SLV_REG13_OFFSET, target2);
	MINER_mWriteReg(base_address, MINER_SLV_REG14_OFFSET, target3);
	MINER_mWriteReg(base_address, MINER_SLV_REG15_OFFSET, target4);
	MINER_mWriteReg(base_address, MINER_SLV_REG16_OFFSET, target5);
	MINER_mWriteReg(base_address, MINER_SLV_REG17_OFFSET, target6);
	MINER_mWriteReg(base_address, MINER_SLV_REG18_OFFSET, target7);
}

void reset() {
	//Reset = 1, Enable = 0;
	MINER_mWriteReg(base_address, MINER_SLV_REG31_OFFSET, 0x2);
}

void start() {
	//Reset = 0, Enable = 1
	MINER_mWriteReg(base_address, MINER_SLV_REG31_OFFSET, 0x1);
}

void ready() {
	//Reset = 0, Enable = 0
	MINER_mWriteReg(base_address, MINER_SLV_REG31_OFFSET, 0x0);
}

u32 get_status_reg() {
	return MINER_mReadReg(base_address,MINER_SLV_REG30_OFFSET);
}

u32 get_nonce() {
	return MINER_mReadReg(base_address,MINER_SLV_REG29_OFFSET);
}

u32 get_hash0() {
	return MINER_mReadReg(base_address,MINER_SLV_REG28_OFFSET);
}

int main()
{
	int status_register;
	int done = 0;
	int hash0;
	int nonce;
	u32 data0, data1, data2;
	u32 midstate0, midstate1, midstate2, midstate3, midstate4, midstate5, midstate6, midstate7;
	u32 target0, target1, target2, target3, target4, target5, target6, target7;

	init_platform();

    print("JOSE'S BITCOIN MINER\n");

    print("Input data\n");
    	scanf("%xlu", &data0);
    	scanf("%xlu", &data1);
    	scanf("%xlu", &data2);
   	xil_printf("Data is: %08x%08x%08x\n", data0, data1, data2);
	set_data(data0, data1, data2);

	print("Input midstate\n");
		scanf("%xlu", &midstate0);
		scanf("%xlu", &midstate1);
		scanf("%xlu", &midstate2);
		scanf("%xlu", &midstate3);
		scanf("%xlu", &midstate4);
		scanf("%xlu", &midstate5);
		scanf("%xlu", &midstate6);
		scanf("%xlu", &midstate7);
		xil_printf("Midstate is: %08x%08x%08x%08x%08x%08x%08x\n", midstate0, midstate1, midstate2, midstate3, midstate4, midstate5, midstate6, midstate7);
	set_midstate(midstate0, midstate1, midstate2, midstate3, midstate4, midstate5, midstate6, midstate7);

	print("Input target\n");
		scanf("%xlu", &target0);
		scanf("%xlu", &target1);
		scanf("%xlu", &target2);
		scanf("%xlu", &target3);
		scanf("%xlu", &target4);
		scanf("%xlu", &target5);
		scanf("%xlu", &target6);
		scanf("%xlu", &target7);
		xil_printf("Target is: %08x%08x%08x%08x%08x%08x%08x\n", target0, target1, target2, target3, target4, target5, target6, target7);
	set_target(0x00000fff, target1, target2, target3, target4, target5, target6, target7);

	reset();

   //Some delay
	static int i;
	for (i=0; i<1000000; ++i);

	ready();

	print("OK\n");
	start();

	print("Calculating hashes...\n");

	while(done == 0){

		status_register = get_status_reg();

//		if (check_bit(status_register, 1)){
//			nonce = get_nonce();
//			xil_printf("Nonce: %08x\n",nonce);
//		}

		if (check_bit(status_register, 3)){
			print("Fail");
			done = 1;
		}

		if (check_bit(status_register, 4)){
			print("Success\n");
			hash0 = get_hash0();
			nonce = get_nonce();
			xil_printf("Hash0: %08x\n",hash0);
			xil_printf("Nonce: %08x\n",nonce);
			done = 1;
		}

	}

    return 0;
}
