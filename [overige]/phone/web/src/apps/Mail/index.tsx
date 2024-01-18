import { Tooltip } from "@mui/material";
import { format, differenceInDays } from "date-fns";
import { FC, useEffect, useState } from "react";
import { FaInbox, FaPaperPlane, FaPlus } from "react-icons/fa";
import { v4 } from "uuid";
import AppTemplate, { Modal, Splitter } from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import FlightModeActive from "../../components/FlightModeActive";
import { Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import { ReceivedMail } from "./Received";
import Sent from "./Sent";

const Mail = () => {
  const [createModal, setCreateModal] = useState(false);
  const [viewingEmail, setViewingEmail] = useState(false);
  const [currentEmail, setCurrentEmail] = useState<IEmail | null>(null);

  const { flightMode, locales } = useCore();

  const openEmail = (email: IEmail) => {
    setCurrentEmail(email);
    setViewingEmail(true);
  };

  const [page, setPage] = useState({ page: "main" });

  const pages = [
    { name: "main", Element: ReceivedMail, args: { openEmail } },
    { name: "sent", Element: Sent, args: { openEmail } },
  ];

  if (flightMode) return <FlightModeActive />;

  const compose = (e: any) => {
    e.preventDefault();

    post("sendEmail", {
      id: v4(),
      to: e.target.email.value,
      content: e.target.content.value,
    }).then(() => {
      setCreateModal(false);
    });
  };

  const deleteEmail = () => {
    if (!currentEmail) return;
    post("removeEmail", {
      id: currentEmail.id,
    }).then(() => {
      setViewingEmail(false);
      setCurrentEmail(null);
    });
  };

  return (
    <AppTemplate>
      <Pages page={page} pages={pages} setPage={setPage} />

      <Tooltip title={locales?.compose} placement="top">
        <button
          onClick={() => setCreateModal(true)}
          className="absolute bottom-[17%] right-4 rounded-full w-14 h-14 flex items-center justify-center focus:ring transition-all bg-blue-500 outline-none"
        >
          <FaPlus />
        </button>
      </Tooltip>

      <Modal isOpen={createModal} close={() => setCreateModal(false)}>
        <form onSubmit={compose} className="grid gap-1">
          <label>{locales?.to}</label>
          <div className="flex gap-2 mb-1 items-center justify-center">
            <input className="input" name="email" required />
          </div>

          <label>{locales?.content}</label>
          <textarea
            className="input resize-none"
            name="content"
            rows={7}
            minLength={3}
            maxLength={280}
            required
          />

          <Splitter />

          <button className="btn">{locales?.send}</button>
        </form>
      </Modal>

      <Modal isOpen={viewingEmail} close={() => setViewingEmail(false)}>
        <label>{currentEmail?.sent ? locales?.to : locales?.from}</label>
        <div className="flex gap-2 mb-1 items-center justify-center">
          <input
            className="input"
            name="email"
            value={currentEmail?.sent ? currentEmail?.to : currentEmail?.from}
            readOnly
          />
        </div>

        <label>{locales?.content}</label>
        <textarea
          className="input resize-none"
          name="content"
          rows={7}
          value={currentEmail?.content}
          readOnly
        />

        <Splitter />

        <button onClick={deleteEmail} className="btn text-red-500">
          {locales?.remove}
        </button>
      </Modal>

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
        <FaInbox />
        <p>{locales?.inbox}</p>
      </div>
      <div
        onClick={() => setPage({ page: "sent" })}
        className={`flex flex-col gap-1 items-center w-full cursor-pointer hover:text-blue-500 !bg-opacity-5 ${
          page === "sent" && "text-blue-500"
        }`}
      >
        <div className="w-fit h-fit flex justify-center flex-col items-center relative">
          {calls > 0 && (
            <div className="flex px-2 select-none items-center justify-center text-white text-xs rounded-full bg-red-500 absolute -right-1 -top-1">
              {calls}
            </div>
          )}

          <FaPaperPlane />
          <p>{locales?.sent}</p>
        </div>
      </div>
    </div>
  );
};

export interface IEmail {
  id: string;
  from: string;
  to: string;
  date: number;
  content: string;
  open?: any;
  sent?: boolean;
}

export const Email: FC<IEmail> = ({ content, date, from, open, sent, to }) => {
  return (
    <div
      onClick={open}
      className="dark:bg-white overflow-hidden select-none bg-black relative flex gap-3  hover:!bg-opacity-10 cursor-pointer items-center dark:text-white !bg-opacity-5 rounded-md p-2 w-full"
    >
      <Avatar className="!w-10 !h-10 flex-none !text-sm" name={from} />

      <div className="w-full overflow-hidden">
        <div className="flex w-full gap-1 justify-between">
          <h1 className="text-ellipsis overflow-hidden">{sent ? to : from}</h1>
          <p className="text-xs opacity-60 font-normal right-2">
            {format(
              new Date(date * 1000),
              differenceInDays(new Date(), new Date(date * 1000)) < 1
                ? "HH:mm"
                : "dd/LL/yyyy"
            )}
          </p>
        </div>
        <p className="opacity-60 text-sm font-normal">{content}</p>
      </div>
    </div>
  );
};

export default Mail;
