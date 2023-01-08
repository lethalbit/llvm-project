add_llvm_component_library(LLVMMCS51Disassembler
  MCS51Disassembler.cpp

  LINK_COMPONENTS
  MCS51Desc
  MCS51Info
  MCDisassembler
  Support

  ADD_TO_COMPONENT
  MCS51
)
