import { Tooltip } from "@mui/material";
import { differenceInDays, format } from "date-fns";
import { FC, useEffect, useState } from "react";
import { FaCheck, FaMapPin, FaPeopleArrows, FaPhone } from "react-icons/fa";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import FlightModeActive from "../../components/FlightModeActive";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const Dispatch = () => {
  const [calls, setCalls] = useState([]);
  const { flightMode, locales } = useCore();

  useEffect(() => {
    post("getDispatchCalls").then((calls: any) => setCalls(calls));

    const listener = (e: any) => {
      if (e.data.type === "refreshDispatch") {
        setCalls(e.data.calls);
      }
    };

    window.addEventListener("message", listener);

    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate className="px-5 py-10 flex flex-col">
      <AppHeader>{locales?.dispatchTitle}</AppHeader>
      <div className="grid gap-1 overflow-auto">
        {calls.length > 0 ? (
          calls.map((call: ICall) => <Call key={call.id} {...call} />)
        ) : (
          <div className="text-center mt-2">{locales?.noCalloutsFound}</div>
        )}
      </div>
    </AppTemplate>
  );
};

interface ICall {
  id: string;
  from: string;
  call: string;
  responding: any;
  date: number;
  location: any;
}

const Call: FC<ICall> = ({ id, from, call, responding, date }) => {
  const { locales } = useCore();

  const respond = () => {
    post("dispatch:respond", { id });
  };

  const callBtn = (e: any) => {
    e.stopPropagation();
    post("call", { number: from });
  };

  return (
    <div
      onClick={respond}
      className="dark:bg-white h-fit hover:!bg-opacity-10 overflow-hidden !bg-opacity-5 relative w-full bg-black p-2 rounded-md"
    >
      <div className="flex justify-between items-center gap-1 mb-1">
        <p className="flex items-center gap-2">
          <FaPhone className="text-blue-500" />
          {from}
        </p>
        <p className="text-gray-400 text-sm">
          {format(
            new Date(date * 1000),
            differenceInDays(new Date(), new Date(date * 1000)) < 1
              ? "HH:mm"
              : "dd/LL/yyyy"
          )}
        </p>
      </div>
      <p className="w-full text-ellipsis overflow-hidden whitespace-nowrap">
        {call}
      </p>

      <div className="flex justify-between border-t !border-opacity-10 dark:border-white border-black pt-2 mt-2">
        <Tooltip title={locales?.responding}>
          <button className="w-full flex items-center justify-center">
            <p className="flex items-center gap-2">
              <FaPeopleArrows />
              {responding.length}
            </p>
          </button>
        </Tooltip>
        <Tooltip title={locales?.call}>
          <button onClick={callBtn} className="w-full">
            <p className="w-full flex items-center justify-center gap-2">
              <FaPhone />
            </p>
          </button>
        </Tooltip>
      </div>
    </div>
  );
};

export default Dispatch;
