PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

ifeq ($(BUILD_MODE),debug)
	CFLAGS += -g -O0
else ifeq ($(BUILD_MODE),run)
	CFLAGS += -O2
else ifeq ($(BUILD_MODE),profile)
	CFLAGS += -g -pg -fprofile-arcs -ftest-coverage
	LDFLAGS += -pg -fprofile-arcs -ftest-coverage
	EXTRA_CLEAN += csc450ct1.gcda csc450ct1.gcno $(PROJECT_ROOT)gmon.out
	EXTRA_CMDS = rm -rf csc450ct1.gcda
else
    $(error Build mode $(BUILD_MODE) not supported by this Makefile)
endif

all:	DisplayPersonInfo Correction1 Correction2

DisplayPersonInfo:	DisplayPersonInfo.o
	$(CXX) $(LDFLAGS) -o $@ $^
	$(EXTRA_CMDS)
	
Correction1: CSC450_CT1_mod1-1.o
	$(CXX) $(LDFLAGS) -o $@ $^
	$(EXTRA_CMDS)
	
Correction2: CSC450_CT1_mod1-2.o
	$(CXX) $(LDFLAGS) -o $@ $^
	$(EXTRA_CMDS)
	

%.o:	$(PROJECT_ROOT)%.cpp
	$(CXX) -c $(CFLAGS) $(CXXFLAGS) $(CPPFLAGS) -o $@ $<

%.o:	$(PROJECT_ROOT)%.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

clean:
	rm -fr csc450ct1 $(OBJS) $(EXTRA_CLEAN)
