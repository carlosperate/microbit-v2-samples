# Same size information command as ARM_GCC, with size provided by LLVM.
set(ARM_NONE_EABI_SIZE "${LLVM_SIZE}")
include("${CMAKE_CURRENT_LIST_DIR}/../ARM_GCC/size-info.cmake")
