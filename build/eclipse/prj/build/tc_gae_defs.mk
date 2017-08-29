#
# compiler defs for GAE toolchain
#

include ../build/macros.mk

################################################################################
#
# This part should be modified only if needed
#
################################################################################

#
# This is the default installation path for GAE. Change it if different
#
TC_PATH_INST_GAE:=C:\Program Files (x86)\GNU Tools ARM Embedded\4.7 2014q2

#
# GAE related section
#
TC_PATH_BIN:=$(call MK_SHORTNAME,"${TC_PATH_INST_GAE}\bin")
TC_PATH_INC:=$(call MK_SHORTNAME,"${TC_PATH_INST_GAE}\arm-none-eabi\include")
TC_PATH_LIB:=$(call MK_SHORTNAME,"${TC_PATH_INST_GAE}\arm-none-eabi\lib")

#
# toolchain executables
#
TC_MAKEDEP:=$(call MK_PATHTOUNX,${TC_PATH_BIN}/arm-none-eabi-gcc.exe -MM)

TC_CC:=$(call MK_PATHTOUNX,${TC_PATH_BIN}/arm-none-eabi-gcc.exe)

TC_ASM:=$(call MK_PATHTOUNX,${TC_PATH_BIN}/arm-none-eabi-gcc.exe -x assembler-with-cpp)

TC_LINK:=$(call MK_PATHTOUNX,${TC_PATH_BIN}/arm-none-eabi-gcc.exe)

TC_GENSCF:=$(call MK_PATHTOUNX,${TC_PATH_BIN}/arm-none-eabi-cpp.exe)

TC_GENBIN:=$(call MK_PATHTOUNX,${TC_PATH_BIN}/arm-none-eabi-objcopy.exe)

#
# toolchain switches macros
#
TC_ASM_VIA=@${1}
TC_CC_VIA=@${1}
TC_LINK_VIA=@${1}
TC_LINK_LIBUSE=
TC_LINK_ENTRY=-e ${1}
TC_LINK_SCF=-T ${1}
TC_LINK_LIST=-Wl,-Map=${1}

#
# constants
#

# toolchain identifiers
TC_NAME:=gae
TC_SUFFIX:=elf

# Assembly opcodes type
TC_ASMTYPE:=gnu

TC_TARGETARM:=-marm
TC_TARGETTHUMB:=-mthumb

# Assembly compiler options
TC_ASMOPTS:=\
  -c                    \
  -Os                   \
  -g -gdwarf-2

# Assembly compiler defines
TC_ASMDEFS:=

# C compiler options
TC_COPTS:=\
  -c                    \
  -Os                   \
  -g -gdwarf-2

# C compiler defines
TC_CDEFS:=

# Linker options
TC_LIBOPTS:=\
  -Wl,--cref                \
  -Wl,--no-warn-mismatch    \
  -Wl,--gc-section          \
  --specs=nano.specs        \
  -u _printf_float          \
  -u _scanf_float

# Scatter file extension
TC_SCFEXT:=map
TC_LIBEXT:=gcc4x

# Linker libraries
TC_LIBNAMES:=\
  m                     \
  stdc++

#
# toolchain macros
#

# convert PATH to toolchain friendly path
MK_TC_PATH=$(call MK_PATHTOUNX,${1})

# command to generate list of linker directory search paths
MK_TC_LIBDIRS=$(if ${1},$(foreach dir,${1},-L${dir}))

# command to generate list of linker directory search paths
MK_TC_LIBS=$(if ${1},$(foreach lib,${1},-l${lib}))

# command to generate scatter file
# 1 - template file
# 2 - output file
# 3 (opt) - armcc options
MK_TC_GENSCF=$(if $(and ${1},${2},${3}),@${TC_GENSCF} -P -E ${1} -o ${2} ${3})

# command to generate binary file
# 1 - input file
# 2 - output file
MK_TC_GENBIN=$(if $(and ${1},${2}),@${TC_GENBIN} -R .itcm_area -R .bss -R .nvm -O binary ${1} ${2})