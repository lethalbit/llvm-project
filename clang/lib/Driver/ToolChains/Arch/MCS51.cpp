//===--- MCS51.cpp - MCS51 Helpers for Tools ---------------------*- C++-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "MCS51.h"
#include "ToolChains/CommonArgs.h"
#include "clang/Driver/Driver.h"
#include "clang/Driver/DriverDiagnostic.h"
#include "clang/Driver/Options.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/Option/ArgList.h"
#include "llvm/Support/Host.h"
#include "llvm/Support/Regex.h"
#include <sstream>

using namespace clang::driver;
using namespace clang::driver::tools;
using namespace clang;
using namespace llvm::opt;

/// getMCS51TargetCPU - Get the (LLVM) name of the MCS51 MCU we are targeting.
std::string mcs51::getMCS51TargetCPU(const ArgList &Args) {
  if (Arg *A = Args.getLastArg(clang::driver::options::OPT_mcpu_EQ)) {
    // The canonical CPU name is captalize. However, we allow
    // starting with lower case or numbers only
    StringRef CPUName = A->getValue();

//     if (CPUName == "native") {
//       std::string CPU = std::string(llvm::sys::getHostCPUName());
//       if (!CPU.empty() && CPU != "generic")
//         return CPU;
//     }
//
//     if (CPUName == "common")
//       return "generic";
//
//     return llvm::StringSwitch<std::string>(CPUName)
//         .Cases("m68000", "68000", "M68000")
//         .Cases("m68010", "68010", "M68010")
//         .Cases("m68020", "68020", "M68020")
//         .Cases("m68030", "68030", "M68030")
//         .Cases("m68040", "68040", "M68040")
//         .Cases("m68060", "68060", "M68060")
//         .Default(CPUName.str());
  }

  return "";
}

void mcs51::getMCS51TargetFeatures(const Driver &D, const llvm::Triple &Triple,
                                 const ArgList &Args,
                                 std::vector<StringRef> &Features) {
}
