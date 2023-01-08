add_llvm_component_group(MCS51)

set(LLVM_TARGET_DEFINITIONS MCS51.td)

tablegen(LLVM MCS51GenGlobalISel.inc       -gen-global-isel)
tablegen(LLVM MCS51GenRegisterInfo.inc     -gen-register-info)
tablegen(LLVM MCS51GenRegisterBank.inc     -gen-register-bank)
tablegen(LLVM MCS51GenInstrInfo.inc        -gen-instr-info)
tablegen(LLVM MCS51GenSubtargetInfo.inc    -gen-subtarget)
tablegen(LLVM MCS51GenMCCodeEmitter.inc    -gen-emitter)
tablegen(LLVM MCS51GenMCPseudoLowering.inc -gen-pseudo-lowering)
tablegen(LLVM MCS51GenDAGISel.inc          -gen-dag-isel)
tablegen(LLVM MCS51GenCallingConv.inc      -gen-callingconv)
tablegen(LLVM MCS51GenAsmWriter.inc        -gen-asm-writer)
tablegen(LLVM MCS51GenAsmMatcher.inc       -gen-asm-matcher)
tablegen(LLVM MCS51GenDisassemblerTable.inc -gen-disassembler)

add_public_tablegen_target(MCS51CommonTableGen)

add_llvm_target(MCS51CodeGen
#   MCS51AsmPrinter.cpp
#   MCS51CollapseMOVEMPass.cpp
#   MCS51ExpandPseudo.cpp
#   MCS51FrameLowering.cpp
#   MCS51InstrInfo.cpp
#   MCS51ISelLowering.cpp
#   MCS51ISelDAGToDAG.cpp
#   MCS51MachineFunction.cpp
#   MCS51MCInstLower.cpp
#   MCS51RegisterInfo.cpp
#   MCS51Subtarget.cpp
#   MCS51TargetMachine.cpp
#   MCS51TargetObjectFile.cpp

  LINK_COMPONENTS
  Analysis
  AsmPrinter
  CodeGen
  Core
  GlobalISel
  MC
  SelectionDAG
  Support
  Target
  MCS51Desc
  MCS51Info

  ADD_TO_COMPONENT
  MCS51
)

add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
add_subdirectory(AsmParser)
add_subdirectory(Disassembler)
