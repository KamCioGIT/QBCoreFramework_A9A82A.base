import { CircularProgress, Tooltip, LinearProgress } from "@mui/material";
import { motion } from "framer-motion";
import React, { FC, useEffect, useState } from "react";
import { FaAngleRight, FaDownload, FaTimes } from "react-icons/fa";
import { start } from "repl";
import { v4 } from "uuid";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import FlightModeActive from "../../components/FlightModeActive";
import { IPageElement, Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const AppStore = () => {
  const { flightMode } = useCore();
  const [page, setPage] = useState({ page: "main" });

  const pages = [{ name: "main", Element: MainPage }];

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate>
      <Pages page={page} pages={pages} setPage={setPage} />
    </AppTemplate>
  );
};

const MainPage: FC<IPageElement> = ({ setPage }) => {
  const [installed, setInstalled] = useState<any>([]);
  const [filtered, setFiltered]: any = useState<any>(null);
  const [apps, setApps] = useState<any>(null);
  const { downloads, startDownload, locales } = useCore();

  useEffect(() => {
    post("getApps").then((data: any) => {
      setApps(data.apps);
      setInstalled(data.installed);
    });

    const onDownloadFinished = (e: any) => {
      const app = e.detail.app;
      if (app) {
        setInstalled((installs: any) => [...installs, app]);
      }
    };

    window.addEventListener("downloadFinished", onDownloadFinished);
    return () => {
      window.removeEventListener("downloadFinished", onDownloadFinished);
    };
  }, []);

  const uninstallApp = (app: string) => {
    setInstalled((n: any) => n.filter((a: any) => a !== app));
    post("uninstallApp", { app });
  };

  const handleSearch = (e: any) => {
    const value = e.target.value.toLowerCase();
    var results = apps.filter((data: any) =>
      data.name.toLowerCase().includes(value)
    );
    setFiltered(results);
  };

  return (
    <AppTemplate className="px-5 pt-10 pb-10 flex flex-col">
      <AppHeader>{locales?.appstoreTitle}</AppHeader>
      <input
        className="input"
        onChange={handleSearch}
        placeholder={locales?.searchApps}
      />

      <div className="grid gap-1 mt-4 content-start overflow-auto">
        {apps ? (
          apps.length > 0 ? (
            filtered ? (
              filtered.length > 0 &&
              filtered.map((app: IApp) => (
                <App
                  key={app.id + "search"}
                  {...app}
                  installing={
                    downloads.filter((d: any) => d.app === app.id).length > 0
                  }
                  installed={installed.includes(app.id)}
                  download={startDownload}
                  uninstall={uninstallApp}
                />
              ))
            ) : (
              apps.map((app: IApp) => (
                <App
                  key={app.id}
                  {...app}
                  installing={
                    downloads.filter((d: any) => d.app === app.id).length > 0
                  }
                  installed={installed.includes(app.id)}
                  download={startDownload}
                  uninstall={uninstallApp}
                />
              ))
            )
          ) : (
            <p className="text-center">No Apps Found</p>
          )
        ) : (
          <LinearProgress className="mx-2" />
        )}
      </div>
    </AppTemplate>
  );
};

interface IApp {
  id: string;
  name: string;
  installing: boolean;
  installed: boolean;
  download: any;
  uninstall: any;
}

const App: FC<IApp> = ({
  id,
  name,
  installing,
  download,
  installed,
  uninstall,
}) => {
  const { locales } = useCore();

  const downloadApp = () => {
    download({ app: id });
  };

  const uninstallApp = () => {
    uninstall(id);
  };

  return (
    <div className="flex items-center justify-between gap-2 w-full dark:bg-white bg-black !bg-opacity-5 rounded-md p-2">
      <div className="flex items-center gap-3">
        <img src={`./apps/${id}.svg`} width="40px" />
        <h1 className="text-lg">{name}</h1>
      </div>

      <Tooltip
        title={
          installed && !installing
            ? locales?.remove
            : !installing
            ? locales?.install
            : locales?.installing
        }
      >
        <span>
          <motion.button
            disabled={installing}
            onClick={installed && !installing ? uninstallApp : downloadApp}
            animate={{ borderRadius: installing ? "50%" : "15%" }}
            transition={{ ease: "easeInOut" }}
            className={`flex w-10 outline-none h-10 items-center justify-center dark:bg-white bg-black p-2 ${
              installing ? "rounded-full" : "rounded-md"
            } !bg-opacity-5 ${!installing && "hover:!bg-opacity-10"}`}
          >
            {installed && !installing ? (
              <FaTimes />
            ) : installing ? (
              <CircularProgress size={"14pt"} />
            ) : (
              <FaDownload />
            )}
          </motion.button>
        </span>
      </Tooltip>
    </div>
  );
};

export default AppStore;
