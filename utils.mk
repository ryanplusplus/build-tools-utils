define set_default_flags
$(eval
  $1_ASFLAGS := $(ASFLAGS)
  $1_CPPFLAGS := $(CPPFLAGS)
  $1_CFLAGS := $(CFLAGS)
  $1_CXXFLAGS := $(CXXFLAGS)
  $1_DEFINES := $(DEFINES)
  $1_INC_DIRS := $(INC_DIRS)
  $1_SYS_INC_DIRS := $(SYS_INC_DIRS)
)
endef

define create_lib
$(eval
  LIBS += $1
)
endef

define create_lib_with_defaults
$(call create_lib,$1)
$(call set_default_flags,$1)
endef

define create_interface_lib
$(eval
  INTERFACE_LIBS += $1
)
endef

define create_interface_lib_with_defaults
$(call create_interface_lib,$1)
$(call set_default_flags,$1)
endef

define current_path
$(subst $(shell pwd)/,,$(dir $(realpath $(lastword $(MAKEFILE_LIST)))))
endef
