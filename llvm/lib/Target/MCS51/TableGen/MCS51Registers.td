//===-- MCS51Registers.td - MCS51 Register List ------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

class MCS51Reg<
	string name, bits<16> num,
	list<Register> subregs = [],
	list<string> altnames = []
> : RegisterWithSubRegs<name, subregs> {
	field bits<16> Num = num;

	let HWEncoding = num;
	let Namespace = "MCS51";
	let SubRegs = subregs;
	let AltNames = altnames;
}

let Namespace = "MCS51" in {
  def sub_lo : SubRegIndex<8>;
  def sub_hi : SubRegIndex<8, 8>;
}

let Namespace = "MCS51" in { def ptr : RegAltNameIndex; }


// General Purpose Registers (BANKED)
def R0     : MCS51Reg<"R0",      0>, DwarfRegNum<[ 0]>;
def R1     : MCS51Reg<"R1",      1>, DwarfRegNum<[ 1]>;
def R2     : MCS51Reg<"R2",      2>, DwarfRegNum<[ 2]>;
def R3     : MCS51Reg<"R3",      3>, DwarfRegNum<[ 3]>;
def R4     : MCS51Reg<"R4",      4>, DwarfRegNum<[ 4]>;
def R5     : MCS51Reg<"R5",      5>, DwarfRegNum<[ 5]>;
def R6     : MCS51Reg<"R6",      6>, DwarfRegNum<[ 6]>;
def R7     : MCS51Reg<"R7",      7>, DwarfRegNum<[ 7]>;
// Special Function Registers
def ACC    : MCS51Reg<"ACC",     8>, DwarfRegNum<[ 8]>;
def B      : MCS51Reg<"B",       9>, DwarfRegNum<[ 9]>;
def PSW    : MCS51Reg<"PSW",    10>, DwarfRegNum<[10]>;
def SP     : MCS51Reg<"SP",     11>, DwarfRegNum<[11]>;
def DPH    : MCS51Reg<"DPH",    12>, DwarfRegNum<[12]>;
def DPL    : MCS51Reg<"DPL",    13>, DwarfRegNum<[13]>;
def P0     : MCS51Reg<"P0",     14>, DwarfRegNum<[14]>;
def P1     : MCS51Reg<"P1",     15>, DwarfRegNum<[15]>;
def P2     : MCS51Reg<"P2",     16>, DwarfRegNum<[16]>;
def P3     : MCS51Reg<"P3",     17>, DwarfRegNum<[17]>;
def IP     : MCS51Reg<"IP",     18>, DwarfRegNum<[18]>;
def IE     : MCS51Reg<"IE",     19>, DwarfRegNum<[19]>;
def TMOD   : MCS51Reg<"TMOD",   20>, DwarfRegNum<[20]>;
def TCON   : MCS51Reg<"TCON",   21>, DwarfRegNum<[21]>;
def T2CON  : MCS51Reg<"T2CON",  22>, DwarfRegNum<[22]>;
def TH0    : MCS51Reg<"TH0",    23>, DwarfRegNum<[23]>;
def TL0    : MCS51Reg<"TL0",    24>, DwarfRegNum<[24]>;
def TH1    : MCS51Reg<"TH1",    25>, DwarfRegNum<[25]>;
def TL1    : MCS51Reg<"TL1",    26>, DwarfRegNum<[26]>;
def TH2    : MCS51Reg<"TH2",    27>, DwarfRegNum<[27]>;
def TL2    : MCS51Reg<"TL2",    28>, DwarfRegNum<[28]>;
def RCAP2H : MCS51Reg<"RCAP2H", 29>, DwarfRegNum<[29]>;
def RCAP2L : MCS51Reg<"RCAP2L", 30>, DwarfRegNum<[30]>;
def SCON   : MCS51Reg<"SCON",   31>, DwarfRegNum<[31]>;
def SBUF   : MCS51Reg<"SBUF",   32>, DwarfRegNum<[31]>;
def PCON   : MCS51Reg<"PCON",   33>, DwarfRegNum<[33]>;

// Weird Pseudo-Register
let SubRegIndices = [sub_lo, sub_hi], CoveredBySubRegs = 1 in {
	def DPTR : MCS51Reg<"DPTR", 34, [DPH, DPL]>, DwarfRegNum<[34]>;
}


def GPR : RegisterClass<"MCS51", [i8], 8, (
	add R0, R1, R2, R3, R4, R5, R6, R7
)>;

def SFR : RegisterClass<"MCS51", [i8], 8, (
	add ACC, B, PSW, SP, DPH, DPL,
	P0, P1, P2, P3, IP, IE,
	TMOD, TCON, T2CON,
	TH0, TL0, TH1, TL1, TH2, TL2,
	RCAP2H, RCAP2L,
	SCON, SBUF, PCON
)>;
