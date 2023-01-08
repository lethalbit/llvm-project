//===-- MCS51DeviceFeatures.td - MCS51 Device Features -----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//


def FeatureROM : SubtargetFeature<
	"ROM", "m_hasROM", "true",
	"Device has onboard ROM"
>;

def FeatureEPROM : SubtargetFeature<
	"EPROM", "m_hasEPROM", "true",
	"Device has onboard EPROM"
>;

def FeatureIsOTP : SubtargetFeature<
	"OTP", "m_isOTP", "true",
	"Device's onboard ROM is One-Time-Programmable"
>;

def Feature4K : SubtargetFeature<
	"4K", "m_OnboardSize", "4096",
	"Device's onboard ROM/EPROM is 4K bytes in size"
>;

def Feature8K : SubtargetFeature<
	"8K", "m_OnboardSize", "8192",
	"Device's onboard ROM/EPROM is 8K bytes in size"
>;

def Feature16K : SubtargetFeature<
	"16K", "m_OnboardSize", "16384",
	"Device's onboard ROM/EPROM is 16K bytes in size"
>;

def Feature32K : SubtargetFeature<
	"32K", "m_OnboardSize", "32768",
	"Device's onboard ROM/EPROM is 32K bytes in size"
>;

def FeatureRRAM128 : SubtargetFeature<
	"REGRAM128", "m_RegisterRAM", "128",
	"Device's onboard Register RAM is 128 bytes in size"
>;

def FeatureRRAM256 : SubtargetFeature<
	"REGRAM256", "m_RegisterRAM", "256",
	"Device's onboard Register RAM is 256 bytes in size"
>;
