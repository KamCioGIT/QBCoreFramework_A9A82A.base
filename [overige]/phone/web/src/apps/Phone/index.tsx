import AppTemplate from "../../components/AppTemplate";
import { BsGridFill } from "react-icons/bs";
import { FC, useEffect, useState } from "react";
import { Pages } from "../../components/Pages";
import DialPage from "./Dial";
import HistoryPage from "./History";
import { post } from "../../lib/post";
import { FaClock } from "react-icons/fa";
import FlightModeActive from "../../components/FlightModeActive";
import { useCore } from "../../providers/CoreProvider";

const Phone = () => {
  const [page, setPage] = useState({ page: "main" });
  const { flightMode } = useCore();

  const pages = [
    { name: "main", Element: DialPage },
    { name: "history", Element: HistoryPage },
  ];

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate>
      <Pages page={page} pages={pages} setPage={setPage} />
      <Footer page={page.page} setPage={setPage} />
    </AppTemplate>
  );
};

interface IFooter {
  page: string;
  setPage: any;
}

const Footer: FC<IFooter> = ({ setPage, page }) => {
  const [calls, setCalls] = useState(0);
  const { locales } = useCore();

  useEffect(() => {
    post("getMissedCalls").then((calls: any) => {
      setCalls(calls);
    });
  }, [page]);

  return (
    <div className="absolute flex !bg-opacity-5 bg-black dark:bg-white h-[6rem] pt-3 select-none border-black dark:border-white !border-opacity-10 border justify-between bottom-0 left-0 w-full">
      <div
        onClick={() => setPage({ page: "main" })}
        className={`flex flex-col gap-1 items-center w-full cursor-pointer hover:text-blue-500 !bg-opacity-5 ${
          page === "main" && "text-blue-500"
        }`}
      >
        <BsGridFill />
        <p>{locales?.dial}</p>
      </div>
      <div
        onClick={() => setPage({ page: "history" })}
        className={`flex flex-col gap-1 items-center w-full cursor-pointer hover:text-blue-500 !bg-opacity-5 ${
          page === "history" && "text-blue-500"
        }`}
      >
        <div className="w-fit h-fit flex justify-center flex-col items-center relative">
          {calls > 0 && (
            <div className="flex px-2 select-none items-center justify-center text-white text-xs rounded-full bg-red-500 absolute -right-1 -top-1">
              {calls}
            </div>
          )}

          <FaClock />
          <p>{locales?.recentCalls}</p>
        </div>
      </div>
    </div>
  );
};

export default Phone;
