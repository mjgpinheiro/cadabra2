set(CADABRA_VERSION_MAJOR 2)
set(CADABRA_VERSION_MINOR 2)
set(CADABRA_VERSION_PATCH 7)
set(CADABRA_VERSION_TWEAK 1)
set(COPYRIGHT_YEARS "2001-2019")
math(EXPR SYSTEM_BITS "${CMAKE_SIZEOF_VOID_P} * 8")
find_program(GIT git PATHS ${GIT_DIR})
if(GIT)
  message("-- Git found: ${GIT}")
  execute_process(COMMAND git rev-parse --short HEAD OUTPUT_VARIABLE GIT_SHORT_SHA     OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(COMMAND git rev-list --count HEAD  OUTPUT_VARIABLE GIT_COMMIT_SERIAL OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(COMMAND git log -1 --date=short --pretty=format:%cd  OUTPUT_VARIABLE GIT_COMMIT_DATE OUTPUT_STRIP_TRAILING_WHITESPACE)
else()
  message("-- Git not found, not including commit SHA")
endif()
if(GIT_SHORT_SHA)
  set(CADABRA_VERSION_BUILD "${GIT_COMMIT_SERIAL}.${GIT_SHORT_SHA}")
else()
  set(CADABRA_VERSION_BUILD "private")
endif()
if(GIT_COMMIT_DATE)
  set(CADABRA_VERSION_DATE "${GIT_COMMIT_DATE}")
else()
  string(TIMESTAMP THE_DATE "%Y-%m-%d" UTC)
  set(CADABRA_VERSION_DATE "${THE_DATE}") 
endif()
