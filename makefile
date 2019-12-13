ifdef OS
	TOOLCHAIN = +stable-i686-pc-windows-msvc
	BINARYNAME = pawn_env.dll
	OUPUTNAME = env.dll
	COPY = copy .\target\release\$(BINARYNAME) plugins\$(OUPUTNAME)
else
	ifeq ($(shell uname), Linux)
		TOOLCHAIN = +stable-i686-unknown-linux-gnu
		BINARYNAME = libpawn_env.so
		OUPUTNAME = env.so
		COPY = cp target/release/$(BINARYNAME) plugins/$(OUPUTNAME)
	endif
endif

build:
	cargo $(TOOLCHAIN) build --release
	$(COPY)

test:
	sampctl package run --forceEnsure --forceBuild

clean:
	cargo clean
