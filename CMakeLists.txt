# Copyright (C) 2012 LuaDist.
# Submitted by David Manura
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.b

project ( luamotif C )
cmake_minimum_required ( VERSION 2.6 )
include ( cmake/dist.cmake )
include ( lua )

find_package ( Motif REQUIRED )

include (CheckFunctionExists)
check_function_exists ( strlcpy HAVE_STRLCPY )
if ( NOT HAVE_STRLCPY )
  set ( EXTRA_SRC strlcpy.c )
endif ()

include_directories ( ${MOTIF_INCLUDE_DIR} )

set ( SRC luamotif.c widgets.c constants.c )

install_lua_module ( motif ${SRC} ${EXTRA_SRC} LINK ${MOTIF_LIBRARIES} )
install_data ( LICENSE README )
install_example ( buttons.lua hello.lua hello_dialog.lua timeout.lua )
install_foo ( LuaMotif )

add_lua_test ( test/test.lua )
