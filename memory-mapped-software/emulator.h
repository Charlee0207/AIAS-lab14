#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>

#ifndef EMULATOR_H__
#define EMULATOR_H__

// 64 KB
#define MEM_BYTES 0x400000 
#define TEXT_OFFSET 0
#define DATA_OFFSET 32768

#define MAX_LABEL_COUNT 128
#define MAX_LABEL_LEN 32
#define MAX_SRC_LEN (1024 * 1024)

// parameter for MM registers for memory
#define ACCEL_BASE_ADDRESS 0x100000
#define ACCEL_ENABLE_OFFSET 0x0
#define ACCEL_STATUS_OFFSET 0x4

#define DMA_BASE_ADDRESS 0x300000
#define DMA_ENABLE_OFFSET 0x0
#define DMA_STATUS_OFFSET 0x14


typedef struct
{
	char *src;
	int offset;
} source;

typedef enum
{
	UNIMPL = 0,

	// instruction added
	MUL,
	//*****************

	ADD,
	ADDI,
	AND,
	ANDI,
	AUIPC,
	BEQ,
	BGE,
	BGEU,
	BLT,
	BLTU,
	BNE,
	JAL,
	JALR,
	LB,
	LBU,
	LH,
	LHU,
	LUI,
	LW,
	OR,
	ORI,
	SB,
	SH,
	SLL,
	SLLI,
	SLT,
	SLTI,
	SLTIU,
	SLTU,
	SRA,
	SRAI,
	SRL,
	SRLI,
	SUB,
	SW,
	XOR,
	XORI,
	HCF
} instr_type;

typedef enum
{
	OPTYPE_NONE, // more like "don't care"
	OPTYPE_REG,
	OPTYPE_IMM,
	OPTYPE_LABEL,
} operand_type;
typedef struct
{
	operand_type type = OPTYPE_NONE;
	char label[MAX_LABEL_LEN];
	int reg;
	uint32_t imm;

} operand;
typedef struct
{
	instr_type op;
	operand a1;
	operand a2;
	operand a3;
	char *psrc = NULL;
	int orig_line = -1;
	bool breakpoint = false;
} instr;

typedef struct
{
	char label[MAX_LABEL_LEN];
	int loc = -1;
} label_loc;

uint32_t mem_read(uint8_t *, uint32_t, instr_type);

#endif