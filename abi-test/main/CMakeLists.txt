idf_component_register(SRCS "abi_c.c" "abi_sweep.c" INCLUDE_DIRS ".")
if(NOT DEFINED ENV{ZIG})
  message(FATAL_ERROR "ZIG 환경 변수에 Xtensa 지원 zig 실행 파일 경로를 지정해야 한다")
endif()
set(ZIG_OPT "ReleaseSmall" CACHE STRING "zig -O 값")
set(ZIG_OBJ ${CMAKE_CURRENT_BINARY_DIR}/abi_zig.o)
add_custom_command(OUTPUT ${ZIG_OBJ}
  COMMAND $ENV{ZIG} build-obj -target xtensa-freestanding-none -mcpu=esp32 -fno-PIC -O ${ZIG_OPT} --name abi_zig -femit-bin=${ZIG_OBJ} ${CMAKE_CURRENT_SOURCE_DIR}/abi.zig
  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/abi.zig ${CMAKE_CURRENT_SOURCE_DIR}/abi_sweep.zig VERBATIM)
add_custom_target(zig_obj DEPENDS ${ZIG_OBJ})
add_dependencies(${COMPONENT_LIB} zig_obj)
target_link_libraries(${COMPONENT_LIB} INTERFACE ${ZIG_OBJ})
