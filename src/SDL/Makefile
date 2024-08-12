EE_OBJS_DIR = ../../obj/SDL/
EE_LIB_DIR = ../../lib/

EE_LIB = $(EE_LIB_DIR)libsdldoom.a
EE_INCS = -I../../ -I../ -I$(PS2SDK)/ports/include -I$(PS2SDK)/ports/include/SDL -I$(PS2SDK)/ports/include/zlib
EE_LIBS = -L$(PS2SDK)/ports/lib -L$(PS2DEV)/gsKit/lib -lpng -lsdlmixer -lm -lsdl -ldebug -lgskit -ldmakit -lcdvd -lps2ip -lnetman -lz

EE_CFLAGS = -DUSE_RWOPS -DHAVE_CONFIG_H -Wall -Wall -Wno-unused -Wno-switch -march=r5900 -Wextra -Wno-missing-field-initializers -Winline -Wwrite-strings -Wundef -Wbad-function-cast -Wcast-align -Wcast-qual -Wdeclaration-after-statement -ffast-math -O2 -fomit-frame-pointer -D_GNU_SOURCE=1 -Dmain=SDL_main
EE_CXXFLAGS = --DUSE_RWOPS -DHAVE_CONFIG_H

SDLDOOM_SOURCES = i_main.o i_network.o i_video.o i_sound.o \
	              i_system.o i_joy.o i_sshot.o

EE_OBJS = $(SDLDOOM_SOURCES)
EE_OBJS := $(EE_OBJS:%=$(EE_OBJS_DIR)%)

all: $(EE_OBJS_DIR) $(EE_LIB_DIR) $(EE_OBJS)
	$(EE_AR) cru $(EE_LIB) $(EE_OBJS)

$(EE_OBJS_DIR):
	mkdir -p $(EE_OBJS_DIR)

$(EE_LIB_DIR):
	mkdir -p $(EE_LIB_DIR)

$(EE_OBJS_DIR)%.o : %.c
	$(EE_C_COMPILE) -c $< -o $@

clean:
	rm -f -r $(EE_OBJS_DIR) $(EE_LIB_DIR)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal