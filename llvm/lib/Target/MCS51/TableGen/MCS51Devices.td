//===-- MCS51Devices.td - MCS51 Device List ----------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// MCS51 Family Feature Sets
//===----------------------------------------------------------------------===//

include "TableGen/MCS51DeviceFeatures.td"

//===----------------------------------------------------------------------===//
// MCS51 Family Scheduling Model
//===----------------------------------------------------------------------===//

include "TableGen/MCS51SchedModel.td"

//===----------------------------------------------------------------------===//
// MCS51 Family Device Models
//===----------------------------------------------------------------------===//

class Device<
	string Name, list<SubtargetFeature> Features
> : ProcessorModel<
	Name, GenericMCS51Model, Features
>;

// 8051 Devices
def : Device<"8031AH",      [
	FeatureRRAM128
]>;
def : Device<"8051AH",      [
	FeatureROM, Feature4K, FeatureRRAM128
]>;
def : Device<"8051AHP",     [
	FeatureROM, Feature4K, FeatureRRAM128
]>;
def : Device<"8751H",       [
	FeatureEPROM, Feature4K, FeatureRRAM128
]>;
def : Device<"8751BH",      [
	FeatureEPROM, Feature4K, FeatureRRAM128
]>;
// 8052 Devices
def : Device<"8032AH",      [
	FeatureRRAM256
]>;
def : Device<"8052AH",      [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
def : Device<"8752BH",      [
	FeatureEPROM, Feature8K, FeatureRRAM256
]>;
// 80C51 Devices
def : Device<"80C31BH",     [
	FeatureRRAM128
]>;
def : Device<"80C51BH",     [
	FeatureROM, Feature4K, FeatureRRAM128
]>;
def : Device<"80C51BHP",    [
	FeatureROM, Feature4K, FeatureRRAM128
]>;
def : Device<"87C51",       [
	FeatureEPROM, Feature4K, FeatureRRAM128
]>;
// 8xC52/54/58 Devices
def : Device<"80C32",       [
	FeatureRRAM256
]>;
def : Device<"80C52",       [
	FeatureROM, Feature8K, FeatureRRAM256

]>;
def : Device<"87C52",       [
	FeatureEPROM, Feature8K, FeatureRRAM256
]>;
def : Device<"80C54",       [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"87C54",       [
	FeatureEPROM, Feature16K, FeatureRRAM256
]>;
def : Device<"80C58",       [
	FeatureROM, Feature32K, FeatureRRAM256
]>;
def : Device<"87C58",       [
	FeatureEPROM, Feature32K, FeatureRRAM256
]>;
// 8xL52/54/58 Devices
def : Device<"80L52",       [
	FeatureROM, Feature8K, FeatureRRAM256

]>;
def : Device<"87L52",       [
	FeatureROM, Feature8K, FeatureIsOTP, FeatureRRAM256

]>;
def : Device<"80L54",       [
	FeatureROM, Feature16K, FeatureRRAM256

]>;
def : Device<"87L54",       [
	FeatureROM, Feature16K, FeatureIsOTP, FeatureRRAM256

]>;
def : Device<"80L58",       [
	FeatureROM, Feature32K, FeatureRRAM256

]>;
def : Device<"87L58",       [
	FeatureROM, Feature32K, FeatureIsOTP, FeatureRRAM256

]>;
// 8xC51FA/FB/FC Devices
def : Device<"80C51FA",     [
	FeatureRRAM256
]>;
def : Device<"83C51FA",     [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
def : Device<"87C51FA",     [
	FeatureEPROM, Feature8K, FeatureRRAM256
]>;
def : Device<"83C51FB",     [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"87C51FB",     [
	FeatureEPROM, Feature16K, FeatureRRAM256
]>;
def : Device<"83C51FC",     [
	FeatureROM, Feature32K, FeatureRRAM256
]>;
def : Device<"87C51FC",     [
	FeatureEPROM, Feature32K, FeatureRRAM256
]>;
// 8xL51FA/FB/FC Devices
def : Device<"80L51FA",     [
	FeatureRRAM256
]>;
def : Device<"83L51FA",     [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
def : Device<"87L51FA",     [
	FeatureROM, Feature8K, FeatureIsOTP, FeatureRRAM256
]>;
def : Device<"83L51FB",     [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"87L51FB",     [
	FeatureROM, Feature16K, FeatureIsOTP, FeatureRRAM256
]>;
def : Device<"83L51FC",     [
	FeatureROM, Feature32K, FeatureRRAM256
]>;
def : Device<"87L51FC",     [
	FeatureROM, Feature32K, FeatureIsOTP, FeatureRRAM256
]>;
// 8xC51GB Devices
def : Device<"80C51GB",     [
	FeatureRRAM256
]>;
def : Device<"83C51GB",     [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
def : Device<"87C51GB",     [
	FeatureEPROM, Feature8K, FeatureRRAM256
]>;
// 8xC152 Devices (Communications Controllers)
def : Device<"80C152JA",    [
	FeatureRRAM256
]>;
def : Device<"80C152JB",    [
	FeatureRRAM256
]>;
def : Device<"83C152JA",    [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
// 8xC51SL Devices (Keyboard Controlelrs)
def : Device<"80C51SL-BG",  [
	FeatureRRAM256
]>;
def : Device<"81C51SL-BG",  [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
def : Device<"83C51SL-BG",  [
	FeatureROM, Feature8K, FeatureRRAM256
]>;
def : Device<"80C51SLAH",   [
	FeatureRRAM256
]>;
def : Device<"81C51SLAH",   [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"83C51SLAH",   [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"87C51SLAH",   [
	FeatureEPROM, Feature16K, FeatureRRAM256
]>;
def : Device<"80C51SLAL",   [
	FeatureRRAM256
]>;
def : Device<"81C51SLAL",   [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"83C51SLAL",   [
	FeatureROM, Feature16K, FeatureRRAM256
]>;
def : Device<"87C51SLAL",   [
	FeatureEPROM, Feature16K, FeatureRRAM256
]>;
