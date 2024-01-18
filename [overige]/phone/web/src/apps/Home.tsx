import { CircularProgress, Skeleton, Tooltip } from "@mui/material";
import { AnimatePresence, motion } from "framer-motion";
import { FC, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import SwipeableViews from "react-swipeable-views";
import AppTemplate from "../components/AppTemplate";
import { useCore } from "../providers/CoreProvider";

interface IHome {
  apps: any;
}

const Home: FC<IHome> = ({ apps }) => {
  const [page, setPage] = useState(1);

  const pages = [];
  for (let i = 1; i <= Math.ceil(apps?.length / 28); i++) {
    const indexOfLastPost = i * 28;
    const indexOfFirstPost = indexOfLastPost - 28;
    const currentApps = apps?.slice(indexOfFirstPost, indexOfLastPost);
    pages.push(currentApps);
  }

  return (
    <AppTemplate className="flex flex-col items-center !h-full !bg-transparent w-full">
      <SwipeableViews
        enableMouseEvents
        containerStyle={{ width: "100%", height: "100%" }}
        style={{ width: "100%", height: "100%" }}
        onChangeIndex={(index) => setPage(index + 1)}
      >
        {pages?.map((p, index) => (
          <div
            key={index}
            className="grid grid-cols-4 gap-x-2 gap-y-4 pt-[45px] content-start w-full h-full px-4 justify-items-center"
          >
            {p?.map((app: any, index: number) => {
              if (app.id == "setup") return;
              return (
                <App
                  key={app.id + index}
                  id={app.id}
                  downloading={app.downloading}
                  hidden={app.hidden}
                  path={"/" + app.id}
                  name={app.name}
                  notifications={app.notifications}
                />
              );
            })}
          </div>
        ))}
      </SwipeableViews>

      {pages.length > 1 && (
        <div className="absolute flex bottom-12 gap-2">
          {pages.map((p, index) => (
            <div
              key={"home" + index}
              className={`w-3 h-3 rounded-full bg-white ${
                page - 1 === index ? "bg-opacity-70" : "bg-opacity-30"
              }`}
            />
          ))}
        </div>
      )}
    </AppTemplate>
  );
};

interface IApp {
  id: string;
  path: string;
  name?: string;
  hidden: boolean;
  downloading: boolean;
  notifications?: number;
}

const App: FC<IApp> = ({
  id,
  path,
  name,
  downloading,
  hidden,
  notifications,
}) => {
  const navigate = useNavigate();
  const { animations, locales } = useCore();
  const [loading, setLoading] = useState(true);

  const handleClick = () => {
    if (downloading) return;
    navigate(path);
  };

  if (hidden) return null;

  return (
    <>
      {!loading ? (
        <Tooltip title={downloading ? locales?.installing : name!}>
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: animations ? 0.2 : 0 }}
            onClick={handleClick}
            className={`w-[60px] h-[60px] cursor-pointer bg-cover relative rounded-lg p-[0.3rem]`}
            style={{ backgroundImage: `url(./apps/${id}.svg)` }}
          >
            <AnimatePresence>
              {downloading ? (
                <motion.div
                  exit={{ scale: 0, opacity: 0 }}
                  className="w-full h-full bg-zinc-900 bg-opacity-60 flex items-center justify-center rounded-full p-2"
                >
                  <CircularProgress size={"18pt"} sx={{ color: "white" }} />
                </motion.div>
              ) : (
                notifications! > 0 && (
                  <div className="flex px-2 select-none items-center justify-center text-white text-sm rounded-full bg-red-500 absolute -right-1 -top-1">
                    {notifications}
                  </div>
                )
              )}
            </AnimatePresence>
          </motion.div>
        </Tooltip>
      ) : (
        <Tooltip title={name!}>
          <div>
            <img
              src={`./apps/${id}.svg`}
              onLoad={() => setLoading(false)}
              className="hidden"
            />
            <Skeleton
              variant="rectangular"
              width={"60px"}
              height={"60px"}
              onClick={handleClick}
              className="w-[60px] h-[60px] rounded-lg cursor-pointer !bg-slate-500"
            />
          </div>
        </Tooltip>
      )}
    </>
  );
};

export default Home;
