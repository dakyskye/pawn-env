#if defined _inc_env
	#undef _inc_env
#endif

#if defined _pawn_env_included
	#endinput
#endif
#define _pawn_env_included

native bool:Env_Has(const env[]);
native bool:Env_Get(const env[], dest[], size=sizeof(dest));
