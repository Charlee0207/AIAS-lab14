#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <string>
#include <sys/stat.h>
#include <cstdio>
#include <ctype.h>
#include <cstdlib>
#include <errno.h>
#include <iostream>
#include "translate.h"

char *concat(const char *s1, const char *s2)
{
	const size_t len1 = strlen(s1);
	const size_t len2 = strlen(s2);
	char *result = (char *)malloc(len1 + len2 + 1); // +1 for the null-terminator
	// in real code you would check for errors in malloc here
	memcpy(result, s1, len1);
	memcpy(result + len1, s2, len2 + 1); // +1 to copy the null-terminator
	return result;
}

void copy_str(char *tgt, const char *src)
{
	char *ptr;
	ptr = strncpy(tgt, src, strlen(src));
	ptr[strlen(src)] = '\0';
}

void copy_path(char *argv1, char **path)
{
	char *ptr;

	if (!(*path = (char *)malloc(sizeof(char) * strlen(argv1))))
	{
		printf("malloc is failed in 'main', copy the argv[1] to char *path.\n");
		exit(2);
	}

	copy_str(*path, argv1);

	ptr = *path + strlen(*path);

	// find the last '/' in argv1
	while (ptr != *path)
	{
		if (*ptr == '/')
		{
			*ptr = '\0';
			break;
		}
		ptr--;
	}

	if (ptr == *path)
		**path = '\0';

	if (**path)
		strcat(*path, "/");
}

void write_data_hex(uint8_t *mem, FILE *data_file)
{
	uint8_t ret = 0;

	for (int i = 0; i < (1 << 10); i++)
	{ // 1kB for DataMem
		ret = (uint8_t)mem_read(mem, i + DATA_OFFSET, LBU);
		fprintf(data_file, "%02x\n", ret);
	}
}

void translate_to_machine_code(uint8_t *mem, instr *imem, char *argv1)
{
	uint32_t inst_cnt = 0;
	bool dexit = false;

	char *path;
	copy_path(argv1, &path);
    FILE *dir_test = fopen(concat(path, "build"), "r");
    if(dir_test == NULL){
        mkdir(concat(path, "build"), 0777);
    }
	FILE *mch_file = fopen(concat(path, "build/m_code.hex"), "w");
	FILE *inst_file = fopen(concat(path, "build/inst.asm"), "w");
	FILE *data_file = fopen(concat(path, "build/data.hex"), "w");

	while (!dexit)
	{
		instr i = imem[inst_cnt];
		uint32_t binary = 0;
		int offset = 0;

		// follow the ISA and combine the fragment information in binary form
		switch (i.op)
		{
		case ADD:
			// rf[i.a1.reg] = rf[i.a2.reg] + rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b000 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case SUB:
			// rf[i.a1.reg] = rf[i.a2.reg] + rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b000 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0100000 << 25;	 // funct7
			break;
		case SLT:											 // rf[i.a1.reg] = (*(int32_t*)&rf[i.a2.reg]) < (*(int32_t*)&rf[i.a3.reg]) ? 1 : 0; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b010 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case SLTU:										 // rf[i.a1.reg] = rf[i.a2.reg] + rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b011 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case AND:											 // rf[i.a1.reg] = rf[i.a2.reg] & rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b111 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case OR:											 // rf[i.a1.reg] = rf[i.a2.reg] | rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b110 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case XOR:											 // rf[i.a1.reg] = rf[i.a2.reg] ^ rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b100 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case SLL:											 // rf[i.a1.reg] = rf[i.a2.reg] << rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b001 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case SRL:											 // rf[i.a1.reg] = rf[i.a2.reg] >> rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b101 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0000000 << 25;	 // funct7
			break;
		case SRA:											 // rf[i.a1.reg] = (*(int32_t*)&rf[i.a2.reg]) >> rf[i.a3.reg]; break;
			binary = (0x0C << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b101 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.reg << 20;		 // rs2
			binary += 0b0100000 << 25;	 // funct7
			break;
		case ADDI:
			// rf[i.a1.reg] = rf[i.a2.reg] + i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b000 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case SLTI:										 // rf[i.a1.reg] = (*(int32_t*)&rf[i.a2.reg]) < (*(int32_t*)&(i.a3.imm)) ? 1 : 0; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b010 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case SLTIU:										 // rf[i.a1.reg] = rf[i.a2.reg] < i.a3.imm ? 1 : 0; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b011 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case ANDI:										 // rf[i.a1.reg] = rf[i.a2.reg] & i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b111 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case ORI:											 // rf[i.a1.reg] = rf[i.a2.reg] | i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b110 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case XORI:										 // rf[i.a1.reg] = rf[i.a2.reg] ^ i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b100 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case SLLI:										 // rf[i.a1.reg] = rf[i.a2.reg] << i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b001 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case SRLI:										 // rf[i.a1.reg] = rf[i.a2.reg] >> i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b101 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			break;
		case SRAI:										 // rf[i.a1.reg] = (*(int32_t*)&rf[i.a2.reg]) >> i.a3.imm; break;
			binary = (0x04 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd
			binary += 0b101 << 12;			 // funct3
			binary += i.a2.reg << 15;		 // rs1
			binary += i.a3.imm << 20;		 // imm
			binary += 0b0100000 << 25;	 // funct7
			break;

		case LB:
			binary = 0x03;						// opcode
			binary += i.a1.reg << 7;	// rd
			binary += 0b000 << 12;		// funct3
			binary += i.a2.reg << 15; // rs1
			binary += i.a3.imm << 20; // offset
			break;
		case LBU:
			binary = 0x03;						// opcode
			binary += i.a1.reg << 7;	// rd
			binary += 0b100 << 12;		// funct3
			binary += i.a2.reg << 15; // rs1
			binary += i.a3.imm << 20; // offset
			break;
		case LH:
			binary = 0x03;						// opcode
			binary += i.a1.reg << 7;	// rd
			binary += 0b001 << 12;		// funct3
			binary += i.a2.reg << 15; // rs1
			binary += i.a3.imm << 20; // offset
			break;
		case LHU:
			binary = 0x03;						// opcode
			binary += i.a1.reg << 7;	// rd
			binary += 0b101 << 12;		// funct3
			binary += i.a2.reg << 15; // rs1
			binary += i.a3.imm << 20; // offset
			break;
		case LW:
			// rf[i.a1.reg] = mem_read(mem, rf[i.a2.reg]+i.a3.imm, i.op); break;
			binary = 0x03;						// opcode
			binary += i.a1.reg << 7;	// rd
			binary += 0b010 << 12;		// funct3
			binary += i.a2.reg << 15; // rs1
			binary += i.a3.imm << 20; // offset
			break;

		case SB:
			binary = (0x08 << 2) + 0x03;				// opcode
			binary += 0b000 << 12;							// funct3
			binary += i.a2.reg << 15;						// rs1
			binary += i.a1.reg << 20;						// rs2
			binary += (i.a3.imm & 0xFE0) << 20; // offset
			binary += (i.a3.imm & 0x1F) << 7;

			break;
		case SH:
			binary = (0x08 << 2) + 0x03;				// opcode
			binary += 0b001 << 12;							// funct3
			binary += i.a2.reg << 15;						// rs1
			binary += i.a1.reg << 20;						// rs2
			binary += (i.a3.imm & 0xFE0) << 20; // offset
			binary += (i.a3.imm & 0x1F) << 7;

			break;
		case SW:															// mem_write(mem, rf[i.a2.reg]+i.a3.imm, rf[i.a1.reg], i.op);
			binary = (0x08 << 2) + 0x03;				// opcode
			binary += 0b010 << 12;							// funct3
			binary += i.a2.reg << 15;						// rs1
			binary += i.a1.reg << 20;						// rs2
			binary += (i.a3.imm & 0xFE0) << 20; // offset
			binary += (i.a3.imm & 0x1F) << 7;

			break;

			// /*

			// case SB: mem[rf[i.a2.reg]+i.a3.imm] = *(uint8_t*)&(rf[i.a1.reg]); break;
			// case SH: *(uint16_t*)&(mem[rf[i.a2.reg]+i.a3.imm]) = *(uint16_t*)&(rf[i.a1.reg]); break;
			// case SW:
			// 	*(uint32_t*)&(mem[rf[i.a2.reg]+i.a3.imm]) = rf[i.a1.reg];
			// 	//printf( "Writing %x to addr %x\n", rf[i.a1.reg], rf[i.a2.reg]+i.a3.imm );
			// break;
			// */

		case BEQ:											 // if ( rf[i.a1.reg] == rf[i.a2.reg] ) pc_next = i.a3.imm; break;
			binary = (0x18 << 2) + 0x03; // opcode
			binary += (0b000 << 12);		 // funct3
			binary += i.a1.reg << 15;		 // rs1
			binary += i.a2.reg << 20;		 // rs2

			offset = i.a3.imm - (inst_cnt << 2);

			binary += (offset & 0x800) >> 4;	 // imm[11] -> inst[7]
			binary += (offset & 0x1E) << 7;		 // imm[4:1] -> inst[11:8]
			binary += (offset & 0x7E0) << 20;	 // imm[10:5] -> inst[30:25]
			binary += (offset & 0x1000) << 19; // imm[12] -> inst[31]
			break;
		case BGE:											 // if ( *(int32_t*)&rf[i.a1.reg] >= *(int32_t*)&rf[i.a2.reg] ) pc_next = i.a3.imm; break;
			binary = (0x18 << 2) + 0x03; // opcode
			binary += (0b101 << 12);		 // funct3
			binary += i.a1.reg << 15;		 // rs1
			binary += i.a2.reg << 20;		 // rs2

			offset = i.a3.imm - (inst_cnt << 2);

			binary += (offset & 0x800) >> 4;	 // imm[11] -> inst[7]
			binary += (offset & 0x1E) << 7;		 // imm[4:1] -> inst[11:8]
			binary += (offset & 0x7E0) << 20;	 // imm[10:5] -> inst[30:25]
			binary += (offset & 0x1000) << 19; // imm[12] -> inst[31]
			break;
		case BGEU:										 // if ( rf[i.a1.reg] >= rf[i.a2.reg] ) pc_next = i.a3.imm; break;
			binary = (0x18 << 2) + 0x03; // opcode
			binary += (0b111 << 12);		 // funct3
			binary += i.a1.reg << 15;		 // rs1
			binary += i.a2.reg << 20;		 // rs2

			offset = i.a3.imm - (inst_cnt << 2);

			binary += (offset & 0x800) >> 4;	 // imm[11] -> inst[7]
			binary += (offset & 0x1E) << 7;		 // imm[4:1] -> inst[11:8]
			binary += (offset & 0x7E0) << 20;	 // imm[10:5] -> inst[30:25]
			binary += (offset & 0x1000) << 19; // imm[12] -> inst[31]
			break;
		case BLT:											 // if ( *(int32_t*)&rf[i.a1.reg] < *(int32_t*)&rf[i.a2.reg] ) pc_next = i.a3.imm; break;
			binary = (0x18 << 2) + 0x03; // opcode
			binary += (0b100 << 12);		 // funct3
			binary += i.a1.reg << 15;		 // rs1
			binary += i.a2.reg << 20;		 // rs2

			offset = i.a3.imm - (inst_cnt << 2);

			binary += (offset & 0x800) >> 4;	 // imm[11] -> inst[7]
			binary += (offset & 0x1E) << 7;		 // imm[4:1] -> inst[11:8]
			binary += (offset & 0x7E0) << 20;	 // imm[10:5] -> inst[30:25]
			binary += (offset & 0x1000) << 19; // imm[12] -> inst[31]
			break;
		case BLTU:										 // if ( rf[i.a1.reg] < rf[i.a2.reg] ) pc_next = i.a3.imm; break;
			binary = (0x18 << 2) + 0x03; // opcode
			binary += (0b110 << 12);		 // funct3
			binary += i.a1.reg << 15;		 // rs1
			binary += i.a2.reg << 20;		 // rs2

			offset = i.a3.imm - (inst_cnt << 2);

			binary += (offset & 0x800) >> 4;	 // imm[11] -> inst[7]
			binary += (offset & 0x1E) << 7;		 // imm[4:1] -> inst[11:8]
			binary += (offset & 0x7E0) << 20;	 // imm[10:5] -> inst[30:25]
			binary += (offset & 0x1000) << 19; // imm[12] -> inst[31]
			break;
		case BNE:
			// if ( rf[i.a1.reg] != rf[i.a2.reg] ) pc_next = i.a3.imm; break;
			binary = (0x18 << 2) + 0x03; // opcode
			binary += (0b001 << 12);		 // funct3
			binary += i.a1.reg << 15;		 // rs1
			binary += i.a2.reg << 20;		 // rs2

			offset = i.a3.imm - (inst_cnt << 2);

			binary += (offset & 0x800) >> 4;	 // imm[11] -> inst[7]
			binary += (offset & 0x1E) << 7;		 // imm[4:1] -> inst[11:8]
			binary += (offset & 0x7E0) << 20;	 // imm[10:5] -> inst[30:25]
			binary += (offset & 0x1000) << 19; // imm[12] -> inst[31]
			break;

		case JAL:
			binary = (0x1B << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;		 // rd

			offset = i.a2.imm - (inst_cnt << 2);

			binary += (offset & 0x100000) << 11; // imm[20] -> inst[31]
			binary += (offset & 0x7FE) << 20;		 // imm[10:1] -> inst[30:21]
			binary += (offset & 0x800) << 9;		 // imm[11] -> inst[20]
			binary += (offset & 0xFF000);				 // imm[19:12] -> inst[19:12]
			break;
		case JALR:
			binary = (0x019 << 2) + 0x03; // opcode
			binary += i.a1.reg << 7;			// rd
			binary += 0b000 << 12;				// funct3
			binary += i.a2.reg << 15;			// rs1
			binary += i.a3.imm << 20;			// imm
			break;
		case AUIPC:
			binary = (0x05 << 2) + 0x03;
			binary += i.a1.reg << 7;
			binary += (i.a2.imm << 12);
			break;

		case MUL:
			binary = (0x0c << 2) + 0x03;
			binary += i.a1.reg << 7;
			binary += i.a2.reg << 15;
			binary += i.a3.reg << 20;
			binary += 1 << 25;
			break;

		case LUI:
			// rf[i.a1.reg] = (i.a2.imm<<12);
			binary = (0x0D << 2) + 0x03;
			binary += i.a1.reg << 7;
			binary += (i.a2.imm << 12);
			break;

		case HCF:
			binary = 0x0000000B;
			dexit = true;
			break;
		case UNIMPL:
		default:
			printf("(Trans)Reached an unimplemented instruction!\n");
			if (i.psrc)
				printf("Instruction: %s\n", i.psrc);
			// printf( "inst: %6d pc: %6d src line: %d\n", inst_cnt, pc, i.orig_line );
			// print_regfile(rf);
			dexit = true;
			break;
		}

		if (i.psrc)
			fprintf(inst_file, "%s\n", i.psrc);

		fprintf(mch_file, "%02x\n", (binary >> 0) & 0xff);
		fprintf(mch_file, "%02x\n", (binary >> 8) & 0xff);
		fprintf(mch_file, "%02x\n", (binary >> 16) & 0xff);
		fprintf(mch_file, "%02x\n", (binary >> 24) & 0xff);

		inst_cnt++;
	}

	// write "hcf" in the inst_file
	fprintf(inst_file, "hcf");

	// write data to data.hex
	write_data_hex(mem, data_file);

	fclose(inst_file);
	fclose(mch_file);
	fclose(data_file);
}
