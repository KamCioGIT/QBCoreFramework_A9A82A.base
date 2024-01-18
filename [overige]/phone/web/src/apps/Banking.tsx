import { Tooltip } from "@mui/material";
import { FC, useEffect, useRef, useState } from "react";
import { FaCcVisa } from "react-icons/fa";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../components/AppTemplate";
import FlightModeActive from "../components/FlightModeActive";
import { post } from "../lib/post";
import { useCore } from "../providers/CoreProvider";

const Banking = () => {
  const [loading, setLoading] = useState(false);
  const [confirm, setConfirm] = useState(false);
  const [bank, setBank] = useState<number | null>(null);
  const playerId = useRef<HTMLInputElement>(null);
  const amount = useRef<HTMLInputElement>(null);
  const { flightMode, locales } = useCore();

  useEffect(() => {
    post("getBank").then((data: any) => {
      setBank(data.bank);
    });
  }, []);

  const handleTransfer = () => {
    setConfirm(false);
    setLoading(true);
    post("transfer", {
      id: playerId.current?.value,
      amt: amount.current?.value,
    }).then(() => {
      setLoading(false);
      post("getBank").then((data: any) => {
        setBank(data.bank);
      });
    });
  };

  const handleSubmit = (e: any) => {
    e.preventDefault();
    setConfirm(true);
  };

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate className="px-5 pt-10">
      <AppHeader>{locales?.bankingTitle}</AppHeader>

      <Card amt={bank} />

      <Splitter className="mt-4" />

      <div className="w-full">
        <p className="text-lg text-center mb-2">{locales?.transfer}</p>
        <form onSubmit={handleSubmit}>
          <div className="grid gap-2">
            <input
              className="input text-md !p-2 !rounded-full text-center"
              required
              ref={amount}
              placeholder={locales?.amount}
            />
            <input
              className="input text-md !p-2 !rounded-full text-center"
              ref={playerId}
              required
              placeholder={locales?.playerId}
            />
          </div>
          <button
            type="submit"
            disabled={loading}
            className="btn-2 bg-blue-500 mt-3 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
          >
            {locales?.transfer}
          </button>
        </form>
      </div>

      <Modal isOpen={confirm} close={() => setConfirm(false)}>
        <h1 className="mb-2 text-lg">{locales?.hangOn}</h1>
        <p className="dark:text-slate-200">{locales?.everythingGood}</p>
        <div className="grid grid-cols-2 gap-1 mt-3">
          <button className="btn" onClick={() => setConfirm(false)}>
            {locales?.no}
          </button>
          <button className="btn" onClick={handleTransfer}>
            {locales?.yes}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface ICard {
  amt: number | null;
}

const Card: FC<ICard> = ({ amt }) => {
  return (
    <div className="relative w-full h-[150px] rounded-md bg-gradient-to-br from-slate-400 to-blue-900 shadow">
      <Tooltip title={amt ? `$${amt?.toLocaleString()}` : ""}>
        <div className="absolute max-w-[150px] font-mono overflow-hidden text-ellipsis left-2 bottom-3 text-xl bg-slate-100 dark:bg-zinc-800 rounded-md px-1">
          ${amt?.toLocaleString()}
        </div>
      </Tooltip>

      <div className="absolute flex items-center gap-2 right-2 text-[44px] text-gray-100 bottom-2">
        <FaCcVisa />
      </div>
    </div>
  );
};

export default Banking;
