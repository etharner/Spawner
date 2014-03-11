FUNCTION(ADD_COPY_STAGE NAME)
    ADD_CUSTOM_COMMAND(TARGET ${NAME} POST_BUILD
    	COMMAND ${CMAKE_COMMAND} -E make_directory ${BIN_PATH}
        COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${NAME}> ${BIN_PATH}
    )
ENDFUNCTION()