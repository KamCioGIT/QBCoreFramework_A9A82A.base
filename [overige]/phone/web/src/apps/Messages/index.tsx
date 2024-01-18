import { Tooltip } from "@mui/material";
import { differenceInDays, format } from "date-fns";
import { FC, useEffect, useState } from "react";
import { FaBook, FaPlus } from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import { v4 } from "uuid";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import FlightModeActive from "../../components/FlightModeActive";
import { IPageElement, Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import ChatPage from "./Chat";

const Messages = () => {
  const location: any = useLocation();
  const [page, setPage] = useState(
    location.state
      ? {
          page: "chat",
          args: {
            number: location.state.data?.number,
          },
        }
      : { page: "main" }
  );
  const { flightMode } = useCore();

  const pages = [
    { name: "main", Element: MainPage },
    { name: "chat", Element: ChatPage },
  ];

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate>
      <Pages page={page} pages={pages} setPage={setPage} />
    </AppTemplate>
  );
};

const MainPage: FC<IPageElement> = ({ setPage }) => {
  const [messages, setMessages] = useState([]);
  const [filtered, setFiltered]: any = useState<any>(null);
  const [closeChatModal, setCloseChat] = useState(false);
  const [newMsg, setNewMsg] = useState(false);
  const [selectedChat, setSelectedChat] = useState<number | null>(null);
  const { locales } = useCore();

  const openMessage = (contact: any) => {
    setPage("chat", { number: contact.number });
  };

  const handleSearch = (e: any) => {
    const value = e.target.value.toLowerCase();
    var results = messages.filter(
      (data: any) =>
        data.msg.toLowerCase().includes(value) |
        data.contact.name.toLowerCase().includes(value)
    );
    setFiltered(results);
  };

  useEffect(() => {
    setFiltered(null);

    post("getMessages").then((data: any) => {
      setMessages(data);
    });

    const listener = (evt: any) => {
      if (evt.data.type.includes("refreshChat")) {
        post("getMessages").then((data: any) => {
          setMessages(data);
        });
      }
    };

    window.addEventListener("message", listener);

    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  const openCloseModal = (number: number) => {
    setSelectedChat(number);
    setCloseChat(true);
  };

  const handleCloseChat = () => {
    post("closeMessage", { number: selectedChat }).then(() => {
      setSelectedChat(null);
      setCloseChat(false);
    });
  };

  return (
    <AppTemplate className="pt-10 pb-10 flex flex-col px-5">
      <AppHeader>{locales?.messagesTitle}</AppHeader>
      <div className="flex gap-1">
        <input
          className="w-full rounded-sm !bg-opacity-5 bg-black dark:bg-white p-1 text-zinc-900 dark:text-white px-2 dark:placeholder:text-white placeholder:!text-opacity-30 focus:ring-2 focus:bg-opacity-10 hover:bg-opacity-10 transition-all ring-blue-400 outline-none font-medium"
          placeholder={locales?.searchMessages}
          onChange={handleSearch}
        />
        <button
          onClick={() => setNewMsg(true)}
          className="btn !w-fit !rounded-sm"
        >
          <FaPlus />
        </button>
      </div>

      <Splitter />

      <div className="flex gap-1 flex-col overflow-auto">
        {messages.length > 0 ? (
          filtered ? (
            filtered.length > 0 &&
            filtered.map((msg: any) => (
              <Message
                key={msg.id}
                {...msg}
                open={openMessage}
                close={openCloseModal}
              />
            ))
          ) : (
            messages.map((msg: any) => (
              <Message
                key={msg.id}
                {...msg}
                open={openMessage}
                close={openCloseModal}
              />
            ))
          )
        ) : (
          <div className="text-center mt-2">{locales?.noMessagesFound}</div>
        )}
      </div>

      <Modal isOpen={newMsg} close={() => setNewMsg(false)}>
        <NewMessage setPage={setPage} />
      </Modal>
      <Modal isOpen={closeChatModal} close={() => setCloseChat(false)}>
        <h1 className="text-lg mb-1">{locales?.closeChat}</h1>
        <div className="flex gap-1 mt-3">
          <button className="btn" onClick={() => setCloseChat(false)}>
            {locales?.no}
          </button>
          <button onClick={handleCloseChat} className="btn-2 bg-red-500">
            {locales?.yes}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface IMessage {
  contact: any;
  date: number;
  msg: string;
  read: boolean;
  close: (number: number) => void;
  open: (number: number) => void;
}

const Message: FC<IMessage> = ({ read, open, contact, date, msg, close }) => {
  return (
    <div
      onContextMenu={() => close(contact.number)}
      onClick={() => open(contact)}
      className="dark:bg-white select-none h-fit bg-black relative flex gap-3 hover:!bg-opacity-10 cursor-pointer items-center dark:text-white !bg-opacity-5 rounded-md p-2 w-full overflow-hidden"
    >
      {!read && (
        <div className="w-2 h-2 absolute bottom-3 left-9 ring-2 ring-black ring-opacity-10 rounded-full bg-blue-500" />
      )}

      <Avatar
        className="flex-none w-10 h-10 !text-sm"
        name={!parseInt(contact.name) && contact.name}
        avatar={contact.avatar}
      />

      <div className="w-full overflow-hidden">
        <div className="flex w-full gap-1 justify-between">
          <h1 className="text-ellipsis overflow-hidden">{contact.name}</h1>
          <p className="text-xs opacity-60 font-normal right-2 capitalize">
            {format(
              new Date(date * 1000),
              differenceInDays(new Date(), new Date(date * 1000)) < 1
                ? "HH:mm"
                : "dd/LL/yyyy"
            )}
          </p>
        </div>
        <p className="dark:text-slate-400 text-slate-500 text-sm font-normal text-ellipsis overflow-hidden whitespace-nowrap">
          {msg}
        </p>
      </div>
    </div>
  );
};

const NewMessage = ({ setPage }: any) => {
  const navigate = useNavigate();
  const { locales } = useCore();

  const startMessage = (e: any) => {
    e.preventDefault();
    setPage("chat", {
      number: e.target.number.value,
    });
  };

  return (
    <form onSubmit={startMessage} className="grid gap-2">
      <div className="flex gap-1">
        <input
          name="number"
          className="input"
          placeholder={locales?.phoneNumber}
          required
        />
        <Tooltip title={locales?.contactsTitle}>
          <button
            type="button"
            onClick={() => navigate("/contacts")}
            className="btn !w-fit !rounded-sm"
          >
            <FaBook />
          </button>
        </Tooltip>
      </div>
      <button type="submit" className="btn">
        {locales?.startMessage}
      </button>
    </form>
  );
};

export default Messages;
