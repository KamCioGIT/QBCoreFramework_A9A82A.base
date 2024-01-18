import { createContext, FC, useContext, useEffect, useState } from "react";
import { v4 } from "uuid";
import { post } from "../lib/post";

interface ICoreContext {
  open: boolean;
  half: boolean;
  locales: any;
  locked: boolean;
  weather: string;
  syncing: boolean;
  animations: boolean;
  darkMode: boolean;
  notifications: boolean;
  background: string;
  backgrounds: Array<any>;
  ringtone: any;
  brightness: number;
  hideNumber: boolean;
  flightMode: boolean;
  bigView: boolean | string | undefined;
  ringtones: Array<any>;
  volume: number;
  scale: number;
  playerId: string | null;
  downloads: any;
  setOpen: React.Dispatch<React.SetStateAction<boolean>>;
  startDownload: (dl: any) => void;
  setDarkMode: (toggle: boolean) => void;
  setAnimations: (toggle: boolean) => void;
  setNotifications: (toggle: boolean) => void;
  setSyncing: (toggle: boolean) => void;
  setWeather: (weather: string) => void;
  setBrightness: (brightness: number) => void;
  changeBackground: (bg: string) => void;
  setLocales: (locales: any) => void;
  setBigView: (view: any) => void;
  setRingtones: (tones: Array<any>) => void;
  setBackgrounds: (bgs: Array<any>) => void;
  setRingtone: (rt: any) => void;
  setHalf: (toggle: boolean) => void;
  setLocked: (toggle: boolean) => void;
  setHideNumber: (toggle: boolean) => void;
  setFlightmode: (toggle: boolean) => void;
  setVolume: (volume: number) => void;
  setScale: (scale: number) => void;
  setPlayerId: (id: string) => void;
  setSettings: (settings: any, ringtones: any) => void;
  setDownloads: (downloads: any) => void;
}

const CoreContext = createContext<ICoreContext | null>(null);

export const useCore = () => useContext(CoreContext) as ICoreContext;

const CoreProvider: FC = ({ children }) => {
  const [open, setOpen] = useState(
    process.env.NODE_ENV === "development" ? true : false
  );
  const [half, setHalf] = useState(false);
  const [locked, setLocked] = useState(
    process.env.NODE_ENV === "development" ? false : true
  );
  const [bigView, setBigView] = useState<any>(false);
  const [syncing, setSyncing] = useState(false);
  const [hideNumber, setHideNumber] = useState(false);
  const [flightMode, setFlightmode] = useState(false);
  const [brightness, setBrightness] = useState(100);
  const [scale, setScale] = useState(1);
  const [volume, setVolume] = useState(15);
  const [animations, setAnimations] = useState(true);
  const [darkMode, setDarkMode] = useState(true);
  const [notifications, setNotifications] = useState(true);
  const [playerId, setPlayerId] = useState<string | null>(null);

  const [background, setBackground] = useState("./backgrounds/default.jpg");
  const [ringtones, setRingtones] = useState<any>([]);
  const [backgrounds, setBackgrounds] = useState<any>([]);
  const [ringtone, setRingtone] = useState(ringtones[0]);
  const [weather, setWeather] = useState("");
  const [locales, setLocales] = useState<any>(null);
  const [downloads, setDownloads] = useState<any>([]);

  function changeBackground(background: string) {
    if (!background) return;
    setBackground(background);
    post("setSetting", { key: "background", value: background });
  }

  function setSettings(settings: any, ringtones: any) {
    setBackground("./backgrounds/default.jpg");
    changeBackground(settings.background);
    setDarkMode(settings.darkMode);
    setAnimations(settings.animations);
    setBrightness(settings.brightness);
    setFlightmode(settings.flightMode);
    setHideNumber(settings.hideNumber);
    setNotifications(settings.notifications);
    setVolume(settings.volume);

    if (settings.ringtone) {
      for (let i = 0; i < ringtones.length; i++) {
        var ringtone = ringtones[i];

        if (ringtone.id === settings.ringtone) {
          setRingtone(ringtone);
          break;
        }

        setRingtone(ringtone);
      }
    }

    post("setupFinished");
  }

  const startDownload = (dl: any) => {
    const id = v4();
    const timeout = Math.floor(Math.random() * 7000) + 2000;
    post("installApp", { app: dl.app, timeout });

    setDownloads((dls: any) => [
      ...dls,
      {
        id,
        ...dl,
        timeout: setTimeout(() => {
          finishDownload({ id, app: dl.app });
        }, timeout),
      },
    ]);
  };

  const finishDownload = (app: any) => {
    setDownloads((curr: any) => {
      var filerted = curr.filter((n: any) => n.id !== app.id);
      return filerted;
    });
    setTimeout(() => {
      window.dispatchEvent(
        new CustomEvent("downloadFinished", { detail: { app: app.app } })
      );
    });
  };

  return (
    <CoreContext.Provider
      value={{
        open,
        setOpen,
        half,
        setHalf,
        locked,
        setLocked,
        animations,
        setAnimations,
        darkMode,
        setDarkMode,
        notifications,
        setNotifications,
        background,
        changeBackground,
        ringtone,
        setRingtone,
        ringtones,
        setRingtones,
        brightness,
        setBrightness,
        bigView,
        setBigView,
        flightMode,
        setFlightmode,
        hideNumber,
        setHideNumber,
        volume,
        setVolume,
        setSettings,
        backgrounds,
        setBackgrounds,
        playerId,
        setPlayerId,
        syncing,
        setSyncing,
        scale,
        setScale,
        weather,
        setWeather,
        locales,
        setLocales,
        downloads,
        setDownloads,
        startDownload,
      }}
    >
      {children}
    </CoreContext.Provider>
  );
};

export default CoreProvider;
