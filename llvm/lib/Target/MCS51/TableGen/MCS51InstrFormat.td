//===-- MCS51InstrFormat.td - MCS51 Instruction Format -----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

class MCS51Inst<
	dag outs, dag ins, string asmstr, list<dag> pattern
> : Instruction {
	let Namespace = "MCS51";

	dag OutOperandList = outs;
	dag InOperandList = ins;

	let AsmString = asmstr;
	let Pattern = pattern;

}

class MCS51Inst8<
	dag outs, dag ins, string asmstr, list<dag> pattern
> : MCS51Inst<outs, ins, asmstr, pattern> {
	field bits<8> Inst;

	let Size = 1;
}

class MCS51Inst16<
	dag outs, dag ins, string asmstr, list<dag> pattern
> : MCS51Inst<outs, ins, asmstr, pattern> {
	field bits<16> Inst;

	let Size = 2;
}

class MCS51Inst24<
	dag outs, dag ins, string asmstr, list<dag> pattern
> : MCS51Inst<outs, ins, asmstr, pattern> {
	field bits<24> Inst;

	let Size = 3;
}
