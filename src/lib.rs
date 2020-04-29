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

		samp::plugin::enable_process_tick();
		let samp_logger = samp::plugin::logger()
			.level(log::LevelFilter::Info);

		let _ = fern::Dispatch::new()
			.format(|callback, message, record| {
				callback.finish(format_args!("[pawn-env] [{}]: {}", record.level().to_string().to_lowercase(), message))
			})
			.chain(samp_logger)
			.apply();

		PawnEnv {
		}
	}
);