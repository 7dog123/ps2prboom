EE_OBJS_DIR = ../obj/
EE_BIN_DIR = ../

EE_BIN = $(EE_BIN_DIR)prboom.elf

EE_INCS = -I$(PS2SDK)/ports/include -I$(PS2SDK)/ports/include/SDL -I$(PS2SDK)/ports/include/zlib -I../ -I./
EE_LIBS = -L$(PS2SDK)/ports/lib -L$(PS2DEV)/gsKit/lib -L../lib -lpng -lsdlmixer -lm -lsdl -ldebug -lgskit -ldmakit -lcdvd -lps2ip -lnetman -lz -lsdldoom

EE_CFLAGS = -DUSE_RWOPS -DHAVE_CONFIG_H -DHAVE_STRLWR -DUSE_SDL -Wall -Wno-unused -Wno-switch -march=r5900 -Wextra -Wno-missing-field-initializers -Winline -Wwrite-strings -Wundef -Wbad-function-cast -Wcast-align -Wcast-qual -Wdeclaration-after-statement -ffast-math -O2 -fomit-frame-pointer -D_GNU_SOURCE=1 -Dmain=SDL_main
EE_CXXFLAGS = -DHAVE_CONFIG_H -DHAVE_STRLWR -DUSE_SDL

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

NET_CLIENT_SRC = d_client.o
USE_GL_SRC =
#USE_GL_SRC = gl_main.o gl_texture.o
WAD_SRC = w_memcache.o
#WAD_SRC = w_mmap.c
EE_OBJS = mmus2mid.o $(COMMON_SRC) $(NET_CLIENT_SRC) $(USE_GL_SRC) $(WAD_SRC)
EE_OBJS := $(EE_OBJS:%=$(EE_OBJS_DIR)%)
EE_OBJS += $(EE_OBJS_DIR)usbd.o
EE_OBJS += $(EE_OBJS_DIR)usbhdfsd.o

all: $(EE_OBJS_DIR) $(EE_BIN_DIR) $(EE_BIN)
	
$(EE_BIN_DIR):
	mkdir -p $(EE_BIN_DIR)

$(EE_OBJS_DIR):
	mkdir -p $(EE_OBJS_DIR)

$(EE_OBJS_DIR)%.o : %.c
	$(EE_C_COMPILE) -c $< -o $@

$(EE_OBJS_DIR)usbd.c : $(PS2SDK)/iop/irx/usbd.irx
	$(PS2SDK)/bin/bin2c $(PS2SDK)/iop/irx/usbd.irx usbd.c usbd

$(EE_OBJS_DIR)usbhdfsd.c : $(PS2SDK)/iop/irx/usbhdfsd.irx
	$(PS2SDK)/bin/bin2c $(PS2SDK)/iop/irx/usbhdfsd.irx usbhdfsd.c usbhdfsd

clean:
	rm -f $(EE_BIN) $(EE_OBJS) usbd.c usbhdfsd.c
	
include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal