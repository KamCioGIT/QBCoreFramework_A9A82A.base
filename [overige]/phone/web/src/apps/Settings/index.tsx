import { Slider, Switch } from "@mui/material";
import { FC, ReactElement, useEffect, useState } from "react";
import {
  FaAngleRight,
  FaBell,
  FaCog,
  FaEyeSlash,
  FaImage,
  FaMoon,
  FaPlane,
  FaSpinner,
  FaSun,
} from "react-icons/fa";
import AppTemplate, { AppHeader, Splitter } from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import { IPageElement, Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { playSound } from "../../lib/sound";
import { useCore } from "../../providers/CoreProvider";
import Background from "./Backgrounds";
import Notifications from "./Notifications";
import Profile from "./Profile";
import System from "./System";

const Settings = () => {
  const [page, setPage] = useState({ page: "main" });

  const pages = [
    { name: "main", Element: MainPage },
    { name: "profile", Element: Profile },
    { name: "background", Element: Background },
    { name: "notifications", Element: Notifications },
    { name: "system", Element: System },
  ];

  return (
    <AppTemplate>
      <Pages page={page} setPage={setPage} pages={pages} />
    </AppTemplate>
  );
};

const MainPage: FC<IPageElement> = ({ setPage }) => {
  const {
    animations,
    setAnimations,
    darkMode,
    setDarkMode,
    brightness,
    setBrightness,
    hideNumber,
    setHideNumber,
    flightMode,
    setFlightmode,
    locales,
  } = useCore();

  const [profile, setProfile] = useState<any>(null);

  const handleFlightChange = (e: any) => {
    post("setSetting", { key: "flightMode", value: e.target.checked });
    setFlightmode(e.target.checked);
  };

  const handleHideNumChange = (e: any) => {
    post("setSetting", { key: "hideNumber", value: e.target.checked });
    setHideNumber(e.target.checked);
  };

  const handleAnimationChange = (e: any) => {
    post("setSetting", { key: "animations", value: e.target.checked });
    setAnimations(e.target.checked);
  };

  const handleColorChange = (e: any) => {
    post("setSetting", { key: "darkMode", value: e.target.checked });
    setDarkMode(e.target.checked);

    if (!e.target.checked) {
      var aSound = null;

      var sounds = ["blind.mp3", "blind2.mp3"];
      aSound = sounds[Math.floor(Math.random() * sounds.length)];

      const sound = playSound("colormode/" + aSound);
      sound.currentTime = 0;
    }
  };

  const handleBrightnessChange = (e: any, value: number) => {
    post("setSetting", { key: "brightness", value: value });
    setBrightness(value);
  };

  useEffect(() => {
    post("getProfile").then((profile: any) => setProfile(profile));
  }, []);

  return (
    <AppTemplate className="pt-10 px-5 absolute w-full">
      <AppHeader>{locales?.settingsTitle}</AppHeader>

      <div
        onClick={() => setPage("profile")}
        className="flex items-center cursor-pointer select-none hover:!bg-opacity-10 relative gap-3 p-2 w-full bg-black dark:bg-white !bg-opacity-5 rounded-md "
      >
        <Avatar
          name={profile?.name}
          avatar={profile?.avatar}
          className="w-10 h-10 !text-sm flex-none"
        />

        <div>
          <h1>{profile?.name}</h1>
          <p className="opacity-60 text-sm font-normal">
            {locales?.profileSubheader}
          </p>
        </div>

        <div className="absolute right-0 m-2 opacity-70">
          <FaAngleRight />
        </div>
      </div>

      <Splitter />

      <div className="flex gap-1 flex-col">
        <MenuSwitch
          icon={<FaPlane />}
          color={"bg-orange-400"}
          label={locales?.airplaneMode}
          onChange={handleFlightChange}
          checked={flightMode}
        />
        <MenuSwitch
          icon={<FaEyeSlash />}
          color={"bg-blue-500"}
          label={locales?.noCallerId}
          checked={hideNumber}
          onChange={handleHideNumChange}
        />
        <MenuSwitch
          icon={<FaMoon />}
          color={"bg-indigo-500"}
          label={locales?.darkMode}
          checked={darkMode}
          onChange={handleColorChange}
        />
        <MenuSwitch
          icon={<FaSpinner />}
          color="bg-green-500"
          label={locales?.animations}
          checked={animations}
          onChange={handleAnimationChange}
        />
        <MenuSlider
          icon={<FaSun />}
          color="bg-blue-500"
          label={locales?.brightness}
          min={20}
          max={100}
          progress={brightness}
          onChange={handleBrightnessChange}
        />
      </div>

      <Splitter />

      <div className="flex gap-1 flex-col">
        <MenuButton
          icon={<FaBell />}
          onClick={() => setPage("notifications")}
          color={"bg-fuchsia-400"}
          isMenu={true}
        >
          {locales?.notifications}
        </MenuButton>
        <MenuButton
          onClick={() => setPage("background")}
          icon={<FaImage />}
          color="bg-yellow-500"
          isMenu={true}
        >
          {locales?.background}
        </MenuButton>
      </div>

      <Splitter />

      <div className="flex gap-1 flex-col">
        <MenuButton
          onClick={() => setPage("system")}
          icon={<FaCog />}
          color="bg-gray-500"
          isMenu={true}
        >
          {locales?.system}
        </MenuButton>
      </div>
    </AppTemplate>
  );
};

interface IMenuSwitch {
  icon?: ReactElement;
  color?: string;
  label: string;
  checked: boolean;
  onChange?: (e?: any) => void;
}

export const MenuSwitch: FC<IMenuSwitch> = ({
  icon,
  color,
  label,
  checked,
  onChange,
}) => {
  return (
    <div className="flex items-center select-none relative gap-2 px-2 w-full bg-black dark:bg-white !bg-opacity-5 rounded-md py-2 ">
      {icon && <div className={`p-[.3rem] rounded-md ${color}`}>{icon}</div>}
      <h1>{label}</h1>
      <div className="absolute right-1">
        <Switch checked={checked} onChange={onChange} size="small" />
      </div>
    </div>
  );
};

interface IMenuButton {
  icon: ReactElement;
  color: string;
  isMenu?: boolean;
  onClick?: (e?: any) => void;
}

export const MenuButton: FC<IMenuButton> = ({
  icon,
  color,
  onClick,
  isMenu,
  children,
}) => {
  return (
    <button
      onClick={onClick}
      className="flex justify-between font-medium select-none outline-none items-center relative gap-2 px-2 w-full bg-black dark:bg-white hover:!bg-opacity-10 cursor-pointer !bg-opacity-5 rounded-md py-2 "
    >
      <div className="flex items-center gap-2">
        <div className={`p-[.3rem] rounded-md ${color}`}>{icon}</div>
        <h1>{children}</h1>
      </div>
      {isMenu && <FaAngleRight />}
    </button>
  );
};

interface IMenuSlider {
  icon?: ReactElement;
  color?: string;
  label: string;
  progress: number;
  max: number;
  min: number;
  onChange?: (e?: any, brightness?: any) => void;
}

export const MenuSlider: FC<IMenuSlider> = ({
  icon,
  color,
  label,
  progress,
  max,
  min,
  onChange,
}) => {
  return (
    <div className="flex items-center select-none relative gap-2 px-2 w-full bg-black dark:bg-white !bg-opacity-5 rounded-md py-2 ">
      {icon && <div className={`p-[.3rem] rounded-md ${color}`}>{icon}</div>}
      <h1>{label}</h1>
      <div className="flex w-[80px] items-center absolute right-4">
        <Slider
          min={min}
          max={max}
          defaultValue={progress}
          onChange={onChange}
        />
      </div>
    </div>
  );
};

export default Settings;
