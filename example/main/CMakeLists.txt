idf_component_register(SRCS "placeholder.c")
set(ZIG_OBJ ${CMAKE_CURRENT_BINARY_DIR}/app_zig.o)
add_custom_command(OUTPUT ${ZIG_OBJ}
  COMMAND zig build-obj -target xtensa-freestanding-none -mcpu=esp32 -fno-PIC -O ReleaseSmall -fno-stack-check --name app_zig -femit-bin=${ZIG_OBJ} ${CMAKE_CURRENT_SOURCE_DIR}/app.zig
  DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/app.zig VERBATIM)
add_custom_target(zig_obj DEPENDS ${ZIG_OBJ})
add_dependencies(${COMPONENT_LIB} zig_obj)
target_link_libraries(${COMPONENT_LIB} INTERFACE ${ZIG_OBJ})
