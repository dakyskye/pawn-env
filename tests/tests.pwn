#define RUN_TESTS

#include <a_samp>
#include <YSI_Core\y_testing>

#include "..\env"

main() { }

Test:Has() {
	new bool:res;

	res = Env_Has("FOOBAR"); // is set
	ASSERT(res == true);

	res = Env_Has("FOOBARBAZ"); // not set
	ASSERT(res == false);
}

Test:Get() {
	new bool:res, val[24];

	res = Env_Get("FOOBAR", val);
	ASSERT(res == true);
	ASSERT(strlen(val) > 0);
	ASSERT(strcmp(val, "dakyskye") == 0);
}
