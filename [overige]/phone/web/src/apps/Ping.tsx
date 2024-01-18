import { motion } from "framer-motion";
import { useRef } from "react";
import AppTemplate from "../components/AppTemplate";
import FlightModeActive from "../components/FlightModeActive";
import { post } from "../lib/post";
import { useCore } from "../providers/CoreProvider";

const Ping = () => {
  const { flightMode, locales } = useCore();
  const id: any = useRef(null);

  const ping = () => {
    const pid = id.current.value;

    if (pid.length > 0) {
      post("pingPlayer", { id: pid });
    }
  };

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate>
      <div
        className="bg-cover bg-center w-full h-full"
        style={{
          backgroundImage:
            "url(https://www.bragitoff.com/wp-content/uploads/2015/11/GTAV_SATELLITE_2048x2048.png)",
        }}
      >
        <div className="px-5 w-full h-full relative text-center items-center gap-5 justify-center flex flex-col dark:bg-black bg-white !bg-opacity-50 backdrop-blur-sm">
          <h1 className="text-4xl mb-5 dark:text-white text-black font-bold">
            {locales?.pingerTitle}
            <span className="text-red-400 ml-1">!</span>
          </h1>
          <input
            ref={id}
            placeholder={locales?.playerId}
            className="text-2xl rounded-full p-2 w-full text-center px-5 !bg-opacity-10 hover:!bg-opacity-20 dark:bg-white bg-black placeholder:text-zinc-700 placeholder:dark:text-zinc-400 outline-none focus:ring ring-blue-500 text-white"
          />
          <motion.button
            onClick={ping}
            whileTap={{ scale: 0.8 }}
            className="rounded-full max-w-[200px] w-full bg-blue-500 text-white p-3 text-xl"
          >
            {locales?.pingBtn}
          </motion.button>
        </div>
      </div>
    </AppTemplate>
  );
};

export default Ping;
