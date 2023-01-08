//===-- MCS51.td - Intel MCS-51 target definitions ---------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This is a target description file for the Intel MCS-51 family, referred
/// to here as the "MCS51" architecture.
///
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// MCS51 Family Device Models
//===----------------------------------------------------------------------===//

include "TableGen/MCS51Devices.td"

//===----------------------------------------------------------------------===//
// MCS51 Family Register File
//===----------------------------------------------------------------------===//

include "TableGen/MCS51Registers.td"

//===----------------------------------------------------------------------===//
// MCS51 Family Instruction Info
//===----------------------------------------------------------------------===//

include "TableGen/MCS51InstrInfo.td"

def MCS51InstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// MCS51 Family Calling Conventions
//===----------------------------------------------------------------------===//

include "TableGen/MCS51CallingConv.td"

//===----------------------------------------------------------------------===//
// MCS51 Family Assembly Writer
//===----------------------------------------------------------------------===//

def MCS51AsmWriter : AsmWriter {
	string AsmWriterClassName = "InstPrinter";
	bit isMCAsmWriter = 1;
}

//===----------------------------------------------------------------------===//
// MCS51 Family Assembly Parser
//===----------------------------------------------------------------------===//

def MCS51AsmParser : AsmParser {
  let ShouldEmitMatchRegisterName = 0;
  let ShouldEmitMatchRegisterAltName = 0;
}

def MCS51AsmParserVariant : AsmParserVariant {
	int Variant = 0;
}

//===----------------------------------------------------------------------===//
// Target
//===----------------------------------------------------------------------===//

def MCS51 : Target {
	let InstructionSet = MCS51InstrInfo;
	let AssemblyParsers = [ MCS51AsmParser ];
	let AssemblyWriters = [ MCS51AsmWriter ];
}
