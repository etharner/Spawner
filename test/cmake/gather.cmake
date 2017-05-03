FUNCTION(ADD_COPY_STAGE NAME)
    ADD_CUSTOM_COMMAND(TARGET ${NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory ${BIN_PATH}
        COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${NAME}> ${BIN_PATH}
    )
ENDFUNCTION()

FUNCTION(GET_PROJECT_NAME PROJECT_ID)
    GET_FILENAME_COMPONENT(RESULT ${CMAKE_CURRENT_LIST_DIR} NAME)
    STRING(REPLACE " " "_" RESULT ${RESULT})
    SET(${PROJECT_ID} "${RESULT}" PARENT_SCOPE)
ENDFUNCTION()

FUNCTION(GET_PROJECT_EXECUTABLE_NAME PROJECT_ID EXECUTABLE_NAME)
    SET(RESULT "${PROJECT_ID}")
    SET(CURRENT_DIRECTORY "..")

    WHILE(1)
        GET_FILENAME_COMPONENT(TMP ${CURRENT_DIRECTORY} ABSOLUTE)
        GET_FILENAME_COMPONENT(TMP ${TMP} NAME)
        STRING(REPLACE " " "_" TMP ${TMP})
        IF (${TMP} STREQUAL "test")
            BREAK()
        ENDIF(${TMP} STREQUAL "test")
        SET(RESULT "${TMP}_${RESULT}")
        SET(CURRENT_DIRECTORY "${CURRENT_DIRECTORY}/..")
    ENDWHILE(1)
    SET(${EXECUTABLE_NAME} "${RESULT}" PARENT_SCOPE)
ENDFUNCTION()

FUNCTION(SUBDIRLIST result curdir)
    FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
    SET(dirlist "")
    FOREACH(child ${children})
        IF(IS_DIRECTORY ${curdir}/${child})
            SET(dirlist ${dirlist} ${child})
        ENDIF()
    ENDFOREACH()
    SET(${result} ${dirlist} PARENT_SCOPE)
ENDFUNCTION()
