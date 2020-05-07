extern crate dotenv;

mod natives;
mod plugin;

use crate::plugin::PawnEnv;
use samp::initialize_plugin;
use dotenv::dotenv;

initialize_plugin!(
	natives: [
		PawnEnv::has_env,
		PawnEnv::get_env
	],
	{
		dotenv().ok();

		PawnEnv {}
	}
);
