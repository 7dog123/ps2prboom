EE_OBJS_DIR = ../obj/
EE_BIN_DIR = ../

USE_GL_SRC ?= 0

ifeq (($(USE_GL_SRC)), 1)
EE_BIN = $(EE_BIN_DIR)glboom.elf
else
EE_BIN = $(EE_BIN_DIR)prboom.elf
endif

EE_INCS = -I$(PS2SDK)/ee/include -I$(PS2SDK)/ports/include -I$(PS2SDK)/ports/include/SDL -I$(PS2SDK)/ports/include/zlib -I../ -I./
EE_LDFLAGS = -L$(PS2SDK)/ee/lib -L$(PS2SDK)/ports/lib -L$(PS2DEV)/gsKit/lib -L../lib 
SDL_LIBS = -lpng -lsdlmixer -lm -lsdl -lmodplug -lmikmod -logg -lopusfile -lopus -lstdc++ 
ifeq (($(USE_GL_SRC)), 1)
PS2GL_LIBS = -lps2glut -lps2gl -lps2stuff 
endif
#  -lcdvd -lhdd -lpoweroff 
IOP_MODULES_LIBS = -lfileXio -lmc -lpad
EE_LIBS = $(IOP_MODULES_LIBS) $(SDL_LIBS) $(PS2GL_LIBS) -lsdldoom -lz -lm -ldebug -lc -lgskit -ldmakit -ldma -lpatches -lconfig

ifeq (($(USE_GL_SRC)), 1)
PS2GL_CFLAGS = -DNO_VU0_VECTORS -DNO_ASM
endif

EE_CFLAGS = $(PS2GL_CFLAGS) -DUSE_RWOPS -DHAVE_CONFIG_H -DHAVE_STRLWR -DUSE_SDL -DPACKEDATTR= -DHAVE_SDL_JOYSTICKGETAXIS -Dstrnicmp=strncasecmp -Dstricmp=strcasecmp -Wall -Wno-unused -Wno-switch -march=r5900 -Wextra -Wno-missing-field-initializers -Winline -Wwrite-strings -Wundef -Wbad-function-cast -Wcast-align -Wcast-qual -Wdeclaration-after-statement -ffast-math -O2 -fomit-frame-pointer -D_GNU_SOURCE=1
EE_CXXFLAGS = -DHAVE_CONFIG_H -DHAVE_STRLWR -DUSE_SDL -DHAVE_SDL_JOYSTICKGETAXIS

COMMON_SRC = \
          am_map.o g_game.o p_mobj.o r_demo.o r_segs.o hu_lib.o lprintf.o \
          p_plats.o r_sky.o d_deh.o hu_stuff.o m_argv.o p_pspr.o m_bbox.o \
          p_saveg.o r_things.o d_items.o m_cheat.o p_setup.o s_sound.o \
          d_main.o p_sight.o sounds.o m_menu.o p_spec.o info.o st_lib.o \
          m_misc.o p_switch.o p_telept.o st_stuff.o m_random.o p_tick.o \
          tables.o p_user.o p_ceilng.o v_video.o doomdef.o p_doors.o \
          p_enemy.o r_bsp.o version.o doomstat.o p_floor.o r_data.o \
		  w_wad.o p_genlin.o dstrings.o p_inter.o wi_stuff.o r_draw.o \
		  f_finale.o p_lights.o z_bmalloc.o p_map.o r_main.o f_wipe.o \
		  z_zone.o p_maputl.o r_plane.o md5.o p_checksum.o r_patch.o \
		  r_fps.o r_filter.o

BIN2C = $(PS2SDK)/bin/bin2c

IRX_OBJS = iomanX.irx fileXio.irx sio2man.irx mcman.irx mcserv.irx padman.irx libsd.irx usbd.irx bdm.irx bdmfs_fatfs.irx  \
usbmass_bd.irx

NET_CLIENT_SRC = d_client.o
ifeq (($(USE_GL_SRC)), 1)
GL_SRC = gl_main.o gl_texture.o
endif
WAD_SRC = w_memcache.o
SDLDOOM_SOURCES = i_main.o i_network.o i_video.o i_sound.o \
	              i_system.o i_joy.o i_sshot.o
#WAD_SRC = w_mmap.c
EE_OBJS = mmus2mid.o $(SDLDOOM_SOURCES) $(COMMON_SRC) $(NET_CLIENT_SRC) $(GL_SRC) $(WAD_SRC)
EE_OBJS := $(EE_OBJS:%=$(EE_OBJS_DIR)%) $(IRX_OBJS:.irx=_irx.o)

all: $(EE_OBJS_DIR) $(EE_BIN_DIR) $(EE_BIN) 
 
$(EE_BIN_DIR):
	mkdir -p $(EE_BIN_DIR)

$(EE_OBJS_DIR): 
	mkdir -p $(EE_OBJS_DIR)

$(EE_OBJS_DIR)%.o : %.c
	$(EE_C_COMPILE) -c $< -o $@

%_irx.c:
	$(BIN2C) $(PS2SDK)/iop/irx/$*.irx $@ $*_irx 

clean:
	rm -fr $(EE_BIN) $(EE_OBJS) $(EE_OBJS_DIR)
	
include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal