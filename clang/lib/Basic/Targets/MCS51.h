//===--- MCS51.h - Declare MCS51 target feature support -------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares MCS51 TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_LIB_BASIC_TARGETS_MCS51_H
#define LLVM_CLANG_LIB_BASIC_TARGETS_MCS51_H

#include "OSTargets.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/Basic/TargetOptions.h"
#include "llvm/ADT/Triple.h"
#include "llvm/Support/Compiler.h"


namespace clang {
namespace targets {

class LLVM_LIBRARY_VISIBILITY MCS51TargetInfo : public TargetInfo {
	static const char *const GCCRegNames[];

	// TODO: Update list
	enum MPUKind {
		MK_Unknown,
		MK_8051,
	} MPU = MK_Unknown;

public:
  MCS51TargetInfo(const llvm::Triple &Triple, const TargetOptions &Opts);

  void getTargetDefines(const LangOptions &Opts,
                        MacroBuilder &Builder) const override;
  ArrayRef<Builtin::Info> getTargetBuiltins() const override;
  bool hasFeature(StringRef Feature) const override;
  ArrayRef<const char *> getGCCRegNames() const override;
  ArrayRef<TargetInfo::GCCRegAlias> getGCCRegAliases() const override;
  std::string convertConstraint(const char *&Constraint) const override;
  bool validateAsmConstraint(const char *&Name,
                             TargetInfo::ConstraintInfo &info) const override;
  llvm::Optional<std::string> handleAsmEscapedChar(char EscChar) const override;
  const char *getClobbers() const override;
  BuiltinVaListKind getBuiltinVaListKind() const override;
  bool setCPU(const std::string &Name) override;
};

} // namespace targets
} // namespace clang

#endif
