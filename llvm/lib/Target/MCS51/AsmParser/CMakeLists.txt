add_llvm_component_library(LLVMMCS51AsmParser
  MCS51AsmParser.cpp

  LINK_COMPONENTS
  MC
  MCParser
  Support
  MCS51CodeGen
  MCS51Info

  ADD_TO_COMPONENT
  MCS51
)
