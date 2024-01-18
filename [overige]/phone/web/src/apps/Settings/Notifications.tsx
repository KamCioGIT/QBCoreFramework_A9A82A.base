import { AnimatePresence, motion } from "framer-motion";
import { FC, useEffect, useState } from "react";
import {
  FaArrowLeft,
  FaBell,
  FaCheck,
  FaMusic,
  FaVolumeUp,
} from "react-icons/fa";
import { MenuButton, MenuSlider, MenuSwitch } from ".";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { playSound } from "../../lib/sound";
import { useCore } from "../../providers/CoreProvider";

const Notifications: FC<IPageElement> = ({ setPage }) => {
  const {
    notifications,
    setNotifications,
    animations,
    volume,
    setVolume,
    locales,
  } = useCore();
  const [ringtones, setRingtones] = useState(false);

  const handleToggle = (e: any) => {
    setNotifications(e.target.checked);
  };

  const handleVolumeChange = (e: any, value: number) => {
    post("setSetting", { key: "volume", value: value });
    setVolume(value);
  };

  return (
    <AppTemplate className="pt-10 px-5 absolute">
      <AppHeader className="flex gap-2">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p>{locales?.notifications}</p>
      </AppHeader>

      <MenuSwitch
        checked={notifications}
        icon={<FaBell />}
        color="bg-blue-500"
        label={locales?.notifications}
        onChange={handleToggle}
      />

      <AnimatePresence initial={false}>
        {notifications && (
          <motion.div
            transition={{ type: "keyframes", duration: animations ? 0.2 : 0 }}
            initial={{ y: 100, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            exit={{ y: 100, opacity: 0 }}
          >
            <Splitter />
            <div className="grid gap-1">
              <MenuSlider
                progress={volume}
                icon={<FaVolumeUp />}
                min={0}
                max={30}
                onChange={handleVolumeChange}
                color="bg-orange-400"
                label={locales?.volume}
              />
              <MenuButton
                icon={<FaMusic />}
                onClick={() => setRingtones(true)}
                color="bg-red-500"
              >
                {locales?.ringtone}
              </MenuButton>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      <Modal isOpen={ringtones} close={() => setRingtones(false)}>
        <RingtoneMenu close={() => setRingtones(false)} />
      </Modal>
    </AppTemplate>
  );
};

interface IRingtoneMenu {
  close: () => void;
}

const RingtoneMenu: FC<IRingtoneMenu> = ({ close }) => {
  const { ringtone, setRingtone, ringtones, locales, volume } = useCore();
  const [currentSound, setSound] = useState<any>(null);

  const handleChange = (ring: any) => {
    if (currentSound) {
      currentSound.pause();
    }

    setRingtone(ring);
    post("setSetting", { key: "ringtone", value: ring.id });

    const sound: any = playSound(ring.file);
    sound.volume = volume / 100;
    sound.currentTime = 0;
    setSound(sound);
    setTimeout(() => {
      sound.pause();
    }, 5000);
  };

  useEffect(() => {
    return () => {
      if (currentSound) {
        currentSound.pause();
      }
    };
  }, [currentSound]);

  return (
    <div className="grid gap-1">
      <div className="grid max-h-[12rem] gap-1 content-start overflow-auto">
        {ringtones.map((ring) => (
          <Checker
            key={ring.id}
            checked={ring.id === ringtone.id}
            onClick={() => handleChange(ring)}
          >
            {ring.label}
          </Checker>
        ))}
      </div>

      <button className="btn mt-2" onClick={close}>
        {locales?.close}
      </button>
    </div>
  );
};

interface IChecker {
  checked: boolean;
  onClick: () => void;
}

const Checker: FC<IChecker> = ({ checked, onClick, children }) => {
  return (
    <button
      onClick={onClick}
      className="flex justify-between font-medium select-none outline-none items-center relative gap-2 px-2 w-full bg-black dark:bg-white hover:!bg-opacity-10 cursor-pointer !bg-opacity-5 rounded-md py-2 "
    >
      <div className="flex items-center gap-2">
        <h1>{children}</h1>
      </div>
      {checked && <FaCheck />}
    </button>
  );
};

export default Notifications;
