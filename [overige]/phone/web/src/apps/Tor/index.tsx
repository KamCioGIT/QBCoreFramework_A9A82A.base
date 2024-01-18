import { createContext, useContext, useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import AppTemplate from "../../components/AppTemplate";
import FlightModeActive from "../../components/FlightModeActive";
import { Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import Chat from "./chat";
import Home from "./home";
import Landing from "./landing";
import Login from "./login";
import Profile from "./profile";
import Register from "./register";

const TorContext = createContext<any>(null);
export const useTor = () => useContext(TorContext);

const Tor = () => {
  const location: any = useLocation();
  const [account, setAccount] = useState<any>(null);
  const [page, setPage] = useState<any>({ page: "main" });
  const { flightMode } = useCore();

  if (flightMode) return <FlightModeActive />;

  const pages = [
    { name: "main", Element: Home },
    { name: "profile", Element: Profile },
    { name: "landing", Element: Landing },
    { name: "login", Element: Login },
    { name: "register", Element: Register },
    { name: "chat", Element: Chat },
  ];

  useEffect(() => {
    post("tor:getAccount").then((account: any) => {
      if (account) {
        setAccount(account);

        if (location.state) {
          setPage({ page: "chat", args: { id: location.state.data.chat } });
        } else {
          setPage({ page: "main" });
        }
      } else {
        setPage({ page: "landing" });
      }
    });
  }, []);

  const login = async (username: string, password: string) => {
    const { status }: any = await post("tor:login", { username, password });
    if (status) {
      setAccount(status);
      setPage({ page: "main" });
      return true;
    } else {
      return false;
    }
  };

  const logout = async () => {
    post("tor:logout");
    setPage({ page: "landing" });
    setTimeout(() => {
      setAccount(null);
    }, 500);
  };

  return (
    <AppTemplate>
      <TorContext.Provider value={{ account, setAccount, login, logout }}>
        <Pages pages={pages} page={page} setPage={setPage} />
      </TorContext.Provider>
    </AppTemplate>
  );
};

export default Tor;
