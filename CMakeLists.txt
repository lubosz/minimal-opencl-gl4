CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
project(minimal-opencl-gl4)

FIND_PACKAGE(OpenCL)
message("OpenCL_LIBRARY: ${OpenCL_LIBRARY} \n")
FIND_PACKAGE(OpenGL)
FIND_PACKAGE(GLEW)
FIND_PACKAGE(GLM)


if(WIN32)

	message("We are on Windows.\n")
	
	# ${GLEW_INCLUDE_PATH} # wtf why does this work on linux? Weird inconsistency in find-script.
	set(GLEW_INCLUDE_PATH ${GLEW_INCLUDE_DIR})


	set(OpenCL_local_include_dir "${CMAKE_SOURCE_DIR}/../")
	message("OpenCL local include directory: ${OpenCL_local_include_dir} \n")

	#w indows cmake has no findGLFW script, hence hardcode...
	set(GLFW3_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/../glfw-3.1.1.bin.WIN64/include")
	message("GLFW3_INCLUDE_PATH: ${GLFW3_INCLUDE_PATH} \n")

	set(GLFW3_LIBRARY "${CMAKE_SOURCE_DIR}/../glfw-3.1.1.bin.WIN64/lib-vc2013/glfw3.lib")
	message("GLFW3_LIBRARY: ${GLFW3_LIBRARY} \n")

else()

	FIND_PACKAGE(glfw3)

endif()




INCLUDE_DIRECTORIES( 
    ${OPENGL_INCLUDE_DIR}
    ${GLEW_INCLUDE_PATH}
    ${GLFW3_INCLUDE_PATH}
    ${GLM_INCLUDE_PATH}
    ${OpenCL_local_include_dir}
)

ADD_EXECUTABLE(minimal-opencl-gl4 main.cpp cll.cpp part2.cpp util.cpp)

TARGET_LINK_LIBRARIES (minimal-opencl-gl4
   ${OPENGL_LIBRARIES}
   ${GLEW_LIBRARY}
   ${OpenCL_LIBRARY}
   ${GLFW3_LIBRARY}
)
