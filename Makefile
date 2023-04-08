create-patch:
	git diff > "bugs/$(bug).patch"

check:
	git apply "bugs/$(bug).patch" && forge test -vv

checks:
	@for bug in $$(ls bugs); do \
		echo "Checking $$bug"; \
		make check bug=$$bug; \
		make clean
	done

clean:
	git checkout