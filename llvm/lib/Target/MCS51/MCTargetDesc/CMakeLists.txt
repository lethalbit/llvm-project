add_llvm_component_library(LLVMMCS51Desc
  MCS51AsmBackend.cpp
  MCS51ELFObjectWriter.cpp
  MCS51InstPrinter.cpp
  MCS51MCAsmInfo.cpp
  MCS51MCCodeEmitter.cpp
  MCS51MCTargetDesc.cpp

  LINK_COMPONENTS
  MC
  MCDisassembler
  Support
  MCS51Info

  ADD_TO_COMPONENT
  MCS51
)
