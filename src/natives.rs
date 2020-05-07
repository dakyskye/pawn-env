use samp::prelude::*;
use samp::native;
use samp::error::AmxResult;
use std::env;

impl super::PawnEnv {
	#[native(name = "Env_Has")]
	pub fn has_env(&mut self, _amx: &Amx, env_var: AmxString) -> AmxResult<bool> {
		Ok(env::var(env_var.to_string()).is_ok())
	}
	#[native(name = "Env_Get")]
	pub fn get_env(&mut self, _amx: &Amx, env_var: AmxString, dest: UnsizedBuffer, size: usize) -> AmxResult<bool> {
		match env::var(env_var.to_string()) {
			Ok(val) => {
				let mut dest = dest.into_sized_buffer(size+1);
				let err = samp::cell::string::put_in_buffer(&mut dest, &val);
				return Ok(err.is_ok());
			}
			Err(_) => {
				return Ok(false);
			}
		}
	}
}
