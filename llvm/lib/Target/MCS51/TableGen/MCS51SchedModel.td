//===-- MCS51SchedModel.td - MCS51 DchedMachineModel -------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

class MCS51SchedModel : SchedMachineModel {
	let LoadLatency = 24; // Most Expensive MOV
	let HighLatency = 48; // MUL/DIV are Exponsive
	let PostRAScheduler = 0;
	let CompleteModel = 0;
}

def GenericMCS51Model : MCS51SchedModel;
