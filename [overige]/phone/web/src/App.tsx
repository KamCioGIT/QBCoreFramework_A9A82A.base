import { useEffect, useState } from "react";
import { Route, Routes, useLocation, useNavigate } from "react-router-dom";
import Home from "./apps/Home";
import Lock from "./apps/Lock";
import Header from "./components/Header";
import HomeBtn from "./components/HomeBtn";
import Screen from "./components/Screen";
import { AnimatePresence, motion } from "framer-motion";
import { useNotifications } from "./providers/NotificationProvider";
import Notifications from "./components/Notifications";
import { useCore } from "./providers/CoreProvider";
import PrivateRoute from "./components/PrivateRoute";
import { post } from "./lib/post";
import { elements } from "./manifest";
import BigView from "./components/BigView";
import Call from "./components/Call";
// @ts-ignore
import { RenderUI } from "./lib/cam.js";
import Setup from "./apps/Setup";

const App = () => {
  const location = useLocation();
  const navigate = useNavigate();

  const [apps, setApps] = useState([]);

  const {
    open,
    half,
    setOpen,
    setHalf,
    animations,
    darkMode,
    background,
    setSettings,
    bigView,
    setBigView,
    setRingtones,
    setBackgrounds,
    setPlayerId,
    setLocked,
    setSyncing,
    setWeather,
    flightMode,
    setLocales,
    locales,
    notifications: notifyEnabled,
  } = useCore();
  const { notifications, notify } = useNotifications();

  const keyListener = (e: any) => {
    if (e.key === "Escape") {
      if (bigView) {
        setBigView(false);
      } else {
        closePhone();
      }
    }
  };

  const closePhone = () => {
    navigate("/");

    if (open) {
      if (half) {
        setHalf(false);
      } else {
        if (notifications.length < 1) {
          setOpen(false);
        } else {
          setHalf(true);
        }
      }
      post("close");
    }
  };

  const listener = ({ data }: any) => {
    if (data.type === "boot") {
      setRingtones(data.ringtones);
      setBackgrounds(data.backgrounds);
      setSettings(data.settings, data.ringtones);
      setPlayerId(data.id);
      setLocales(data.locales);
    } else if (data.type === "sync") {
      setSyncing(data.toggle);
      if (!data.toggle) {
        notify({
          app: "settings",
          title: locales?.syncing,
          content: locales?.allDataSaved,
        });
      }
    } else if (data.type === "open") {
      setWeather(data.weather);

      if (open && half) {
        setHalf(false);
      } else {
        setOpen(true);
      }

      if (data.setup) {
        setLocked(false);
        setTimeout(() => {
          navigate("/setup");
        }, 100);
      }
    } else if (data.type === "close") {
      closePhone();
    } else if (data.type === "lock") {
      setLocked(true);
    } else if (data.type === "setApps") {
      setApps(data.apps);
    } else if (data.type === "notify") {
      if (flightMode) return;

      if (data.notification.app === "phone") {
        notify({
          ...data.notification,
          canClose: false,
          duration: -1,
          content: (n: any) => (
            <Call
              notify={n}
              incoming={data.notification.incoming}
              callid={data.notification.CallID}
            />
          ),
        });
      } else {
        if (data.notification.sameApp) {
          notify(data.notification);
        } else {
          if (!location.pathname.includes(data.notification.app)) {
            notify(data.notification);
          }
        }
      }
    }
  };

  useEffect(() => {
    window.addEventListener("keyup", keyListener);
    return () => {
      window.removeEventListener("keyup", keyListener);
    };
  }, [half, open, notifications, bigView, location]);

  useEffect(() => {
    const focus = (e: any) => {
      if (e.target.nodeName === "INPUT" || e.target.nodeName === "TEXTAREA") {
        post("focus");
      }
    };

    const unfocus = (e: any) => {
      if (e.target.nodeName === "INPUT" || e.target.nodeName === "TEXTAREA") {
        post("unfocus");
      }
    };

    document.addEventListener("focusin", focus);
    document.addEventListener("focusout", unfocus);

    return () => {
      document.removeEventListener("focusin", focus);
      document.removeEventListener("focusout", unfocus);
    };
  }, [location]);

  useEffect(() => {
    // @ts-ignore
    window.mainRender = new RenderUI();
    // @ts-ignore
    window.mainRender.initialize();

    if (process.env.NODE_ENV === "development") {
      let devApps: any = [];
      Object.keys(elements).map(function (key, index) {
        devApps.push({ id: key, name: key });
      });
      setApps(devApps);
    }
  }, []);

  useEffect(() => {
    window.addEventListener("message", listener);
    return () => {
      window.removeEventListener("message", listener);
    };
  }, [half, notifyEnabled, open, notifications, bigView, location]);

  return (
    <>
      <div className="w-screen h-screen absolute top-0 left-0" id="app"></div>
      <div
        className={`w-screen h-screen font-medium overflow-hidden relative ${
          darkMode && "dark"
        }`}
      >
        <BigView />

        <AnimatePresence>
          {open && (
            <motion.div
              initial={{ y: 800 }}
              animate={{
                y: !half ? 0 : 550,
              }}
              exit={{ y: 800 }}
              transition={{
                type: "keyframes",
                duration: animations ? 0.25 : 0,
              }}
              className="absolute right-1 bottom-1 bg-cover w-[315px] h-[665px]"
            >
              <div
                className="case"
                style={{ backgroundImage: "url(./case.svg)" }}
              />
              <Screen background={background}>
                <Header />

                <Notifications />

                <AnimatePresence exitBeforeEnter={true}>
                  <Routes location={location} key={location.pathname}>
                    <Route path="/lock" element={<Lock />} />

                    <Route
                      path="/"
                      element={<PrivateRoute element={<Home apps={apps} />} />}
                    />

                    <Route
                      path="/setup"
                      element={<PrivateRoute element={<Setup />} />}
                    />

                    {apps?.map(({ id }: any) => {
                      const Element = elements[id];
                      return (
                        <Route
                          key={"route" + id}
                          path={id}
                          element={<PrivateRoute element={Element} />}
                        />
                      );
                    })}
                  </Routes>
                </AnimatePresence>

                <AnimatePresence>
                  {["/setup", "/"].indexOf(location.pathname) < 0 && (
                    <HomeBtn />
                  )}
                </AnimatePresence>
              </Screen>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </>
  );
};

export default App;
