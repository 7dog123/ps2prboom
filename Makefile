all:
	$(MAKE) -C src/SDL all
	$(MAKE) -C src all

clean:
	$(MAKE) -C src/SDL clean
	$(MAKE) -C src clean