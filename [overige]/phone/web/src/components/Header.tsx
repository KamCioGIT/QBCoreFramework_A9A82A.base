import { Tooltip } from "@mui/material";
import { format } from "date-fns";
import { useEffect, useState } from "react";
import { BsCloudLightning, BsCloudLightningRainFill } from "react-icons/bs";
import {
  FaCloud,
  FaCloudRain,
  FaCloudSun,
  FaCloudUploadAlt,
  FaEyeSlash,
  FaLock,
  FaLockOpen,
  FaMoon,
  FaPlane,
  FaSignal,
  FaSmog,
  FaSnowflake,
  FaSpider,
  FaSun,
} from "react-icons/fa";
import { useLocation } from "react-router-dom";
import { useCore } from "../providers/CoreProvider";

const WEATHERS: any = {
  ["CLOUDS"]: { icon: <FaCloud />, label: "Cloudy" },
  ["CLEAR"]: { icon: <FaCloudSun />, label: "Clear" },
  ["FOGGY"]: { icon: <FaSmog />, label: "Foggy" },
  ["SMOG"]: { icon: <FaSmog />, label: "Smoggy" },
  ["NEUTRAL"]: { icon: <FaCloud />, label: "Neutral" },
  ["HALLOWEEN"]: { icon: <FaSpider />, label: "Halloween" },
  ["THUNDER"]: { icon: <BsCloudLightningRainFill />, label: "Thunder" },
  ["RAIN"]: { icon: <FaCloudRain />, label: "Rain" },
  ["EXTRASUNNY"]: { icon: <FaSun />, label: "Sunny" },
  ["OVERCAST"]: { icon: <FaCloudSun />, label: "Overcast" },
  ["CLEARING"]: { icon: <FaCloudSun />, label: "Clearing" },
  ["BLIZZARD"]: { icon: <FaSnowflake />, label: "Blizzard" },
  ["SNOW"]: { icon: <FaSnowflake />, label: "Snow" },
  ["SNOWLIGHT"]: { icon: <FaSnowflake />, label: "Snow" },
  ["XMAS"]: { icon: <FaSnowflake />, label: "Snow" },
};

const Header = () => {
  const { pathname } = useLocation();
  const {
    locked,
    setLocked,
    syncing,
    flightMode,
    hideNumber,
    playerId,
    weather,
  } = useCore();
  const [date, setDate] = useState<any>(new Date());
  const [intervalId, setIntervalId] = useState<any>(null);

  const lockPhone = () => {
    setLocked(true);
  };

  useEffect(() => {
    return () => {
      clearInterval(intervalId);
    };
  }, [intervalId]);

  useEffect(() => {
    let id = setInterval(() => {
      setDate(new Date());
    }, 5000);

    setIntervalId(id);
  }, []);

  return (
    <div
      className={`w-full drop-shadow-lg absolute top-0 flex z-[40] justify-between ${
        (pathname === "/" || pathname === "/lock") && "!text-white"
      } dark:text-white text-zinc-800 pt-1 px-5 text-md`}
    >
      <div className="flex items-center gap-2 select-none">
        {date && format(date, "HH:mm")}
        <p>#{playerId && playerId}</p>
      </div>
      <div className="flex gap-2 text-lg relative items-center justify-center">
        {hideNumber && <FaEyeSlash className="text-sm mt-[1px]" />}
        {flightMode ? <FaPlane /> : <FaSignal />}
        {syncing && (
          <FaCloudUploadAlt className="mb-[1px] text-blue-500 text-[16px]" />
        )}
        <Tooltip title={WEATHERS[weather] ? WEATHERS[weather].label : "Cloudy"}>
          <div>{WEATHERS[weather] ? WEATHERS[weather].icon : <FaCloud />}</div>
        </Tooltip>
        {pathname !== "/setup" &&
          (locked ? (
            <FaLock className="mb-[1px] text-red-500 text-[16px]" />
          ) : (
            <FaLockOpen
              onClick={lockPhone}
              className="mb-[1px] text-green-500 text-[16px] cursor-pointer"
            />
          ))}
      </div>
    </div>
  );
};

export default Header;
