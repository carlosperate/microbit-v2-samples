# Same hex generation command as ARM_GCC, with objcopy provided by LLVM.
set(ARM_NONE_EABI_OBJCOPY "${LLVM_OBJCOPY}")
include("${CMAKE_CURRENT_LIST_DIR}/../ARM_GCC/hex-generator.cmake")
