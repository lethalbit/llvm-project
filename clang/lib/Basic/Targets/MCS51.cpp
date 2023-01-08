//===--- MCS51.cpp - Implement MCS51 targets feature support-------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements MCS51 TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#include "MCS51.h"
#include "clang/Basic/Builtins.h"
#include "clang/Basic/Diagnostic.h"
#include "clang/Basic/TargetBuiltins.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/Support/TargetParser.h"
#include <cstdint>
#include <cstring>
#include <limits>


namespace clang {
namespace targets {

MCS51TargetInfo::MCS51TargetInfo(const llvm::Triple &Triple, const TargetOptions& opts)
	: TargetInfo(Triple) {

  resetDataLayout(
	"e-"     // Little Endian
	"P1-"    // Harvard Architecture (Separate Program/Data buses)
	"p:8:8-" // 8-bit pointer
	"i8:8-"  // 8-bit integer alignment
	"m:e-"   // ELF-Style name mangling
	"n8:16"  // 8 and 16 bit ints
  );

  SizeType = UnsignedInt;
  PtrDiffType = SignedInt;
  IntPtrType = SignedInt;
}

bool MCS51TargetInfo::setCPU(const std::string &Name) {
	StringRef N = Name;

	// TODO: Update list
	MPU = llvm::StringSwitch<MPUKind>(N)
		.Case("8051", MK_8051)
		.Default(MK_Unknown);
	return MPU != MK_Unknown;

}

void MCS51TargetInfo::getTargetDefines(const LangOptions &Opts,
                                      MacroBuilder &Builder) const {
	using llvm::Twine;

	Builder.defineMacro("__mcs51__");

	switch(MPU) {
	  case MK_8051:
		Builder.defineMacro("__8051");
		Builder.defineMacro("__8051__");
		break;
	  default:
        break;
	}
}

ArrayRef<Builtin::Info> MCS51TargetInfo::getTargetBuiltins() const {
  // TODO: Implement this
  return None;
}

bool MCS51TargetInfo::hasFeature(StringRef Feature) const {
  // TODO: Implement
  return Feature == "8051";
}

const char *const MCS51TargetInfo::GCCRegNames[] = {
  "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7",
  "ACC", "B", "PSW", "SP", "DPL", "DPH",
  "P0", "P1", "P2", "P3", "IP", "IE", "TMON",
  "TCON", "TH0", "TL0", "TH1", "TL1", "SBUF",
  "PCON"
};

ArrayRef<const char *> MCS51TargetInfo::getGCCRegNames() const {
  return llvm::makeArrayRef(GCCRegNames);
}

ArrayRef<TargetInfo::GCCRegAlias> MCS51TargetInfo::getGCCRegAliases() const {
  // No aliases.
  return None;
}

bool MCS51TargetInfo::validateAsmConstraint(const char *&Name, TargetInfo::ConstraintInfo &info) const {
  // TODO: ???
  switch (*Name) {
  default:
    break;
  }
  return false;
}

llvm::Optional<std::string>
MCS51TargetInfo::handleAsmEscapedChar(char EscChar) const {
  char C;
  switch (EscChar) {
  case '.':
  case '#':
    C = EscChar;
    break;
  case '/':
    C = '%';
    break;
  case '$':
    C = 's';
    break;
  case '&':
    C = 'd';
    break;
  default:
    return llvm::None;
  }

  return std::string(1, C);
}

std::string MCS51TargetInfo::convertConstraint(const char *&Constraint) const {
  if (*Constraint == 'C')
    // Two-character constraint; add "^" hint for later parsing
    return std::string("^") + std::string(Constraint++, 2);

  return std::string(1, *Constraint);
}

const char *MCS51TargetInfo::getClobbers() const {
  // FIXME: Is this really right?
  return "";
}

TargetInfo::BuiltinVaListKind MCS51TargetInfo::getBuiltinVaListKind() const {
  return TargetInfo::VoidPtrBuiltinVaList;
}

} // namespace targets
} // namespace clang
