# Clang/LLVM is NOT the officially supported toolchain for micro:bit V2 CODAL applications, ARM_GCC is.
# This best-effort alternative targets LLVM toolchains that bundle bare-metal Arm runtimes, such as
# Arm Toolchain for Embedded with its newlib-nano overlay. Select it with CODAL_TOOLCHAIN=CLANG.
find_program(LLVM_RANLIB llvm-ranlib)
find_program(LLVM_AR llvm-ar)
find_program(CLANG clang)
find_program(CLANGPP clang++)
find_program(LLVM_OBJCOPY llvm-objcopy)
find_program(LLVM_SIZE llvm-size)

# Reuse the ARM_GCC settings with the LLVM tools. The archiver and ranlib are cache variables,
# so they must be set before the include, the compilers are overridden after it.
SET(CMAKE_AR "${LLVM_AR}" CACHE FILEPATH "Archiver")
SET(CMAKE_RANLIB "${LLVM_RANLIB}" CACHE FILEPATH "rlib")
include("${CMAKE_CURRENT_LIST_DIR}/../ARM_GCC/toolchain.cmake")

set(CODAL_TOOLCHAIN "CLANG")
set(CMAKE_C_COMPILER "${CLANG}")
set(CMAKE_CXX_COMPILER "${CLANGPP}")
