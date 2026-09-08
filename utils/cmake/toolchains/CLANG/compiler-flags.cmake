# Clang/LLVM is NOT the officially supported toolchain, see toolchain.cmake. The ARM_GCC compile and
# link rules are reused, this file only adds the Clang-specific differences.
include("${CMAKE_CURRENT_LIST_DIR}/../ARM_GCC/compiler-flags.cmake")

# Clang needs the target triple, and --config=newlib-nano.cfg selects the newlib-nano runtime of Arm
# Toolchain for Embedded (the equivalent of GCC's --specs=nano.specs). The -Wl options that
# target.json passes at compile time are ignored by GCC but warned about by Clang.
set(CLANG_FLAGS "--target=arm-none-eabi --config=newlib-nano.cfg -Wno-unused-command-line-argument")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CLANG_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CLANG_FLAGS}")
set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} ${CLANG_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${CLANG_FLAGS}")

# Remove the GNU ld only option, the GCC specs and the GCC runtime libraries from the link commands,
# the Clang driver adds its own runtimes instead (newlib-nano via --config, libc++, compiler-rt).
foreach(FLAGS device.linker_flags CMAKE_C_LINK_EXECUTABLE CMAKE_CXX_LINK_EXECUTABLE)
    string(REGEX REPLACE "-Wl,--no-wchar-size-warning|--specs=nano.specs|-lstdc\\+\\+|-lsupc\\+\\+|-lgcc" "" ${FLAGS} "${${FLAGS}}")
endforeach()
