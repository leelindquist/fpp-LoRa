include /opt/fpp/src/makefiles/common/setup.mk

all: libfpp-LoRa.so

OBJECTS_fpp_LoRa_so += src/FPPLoRa.o
LIBS_fpp_LoRa_so += -L/opt/fpp/src -lfpp
CXXFLAGS_src/FPPLoRa.o += -I/opt/fpp/src

%.o: %.cpp Makefile
	$(CCACHE) $(CC) $(CFLAGS) $(CXXFLAGS) $(CXXFLAGS_$@) -c $< -o $@

libfpp-LoRa.so: $(OBJECTS_fpp_LoRa_so) /opt/fpp/src/libfpp.so 
	$(CCACHE) $(CC) -shared $(CFLAGS_$@) $(OBJECTS_fpp_LoRa_so) $(LIBS_fpp_LoRa_so) $(LDFLAGS) -o $@

clean:
	rm -f libfpp-LoRa.so $(OBJECTS_fpp_LoRa_so)
