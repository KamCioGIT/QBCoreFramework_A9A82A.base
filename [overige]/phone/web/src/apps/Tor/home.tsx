import { Tooltip } from "@mui/material";
import React, { FC, useEffect, useState } from "react";
import { FaBellSlash, FaPlus, FaUserSecret } from "react-icons/fa";
import { useTor } from ".";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import { MenuSwitch } from "../Settings";

const Home: FC<IPageElement> = ({ setPage }) => {
  const { account } = useTor();
  const [privateChat, setPrivate] = useState(false);
  const [addChat, setAddChat] = useState(false);
  const [joinChat, setJoinChat] = useState(false);
  const [createChat, setCreateChat] = useState(false);
  const [publicChats, setPublicChats] = useState<any>([]);
  const [error, setError] = useState<any>(null);
  const [chats, setChats] = useState<any>([]);
  const { locales } = useCore();

  useEffect(() => {
    post("tor:getChats").then((chats: any) => {
      setChats(chats);
    });

    const listener = (e: any) => {
      if (e.data.type === "tor:refreshChats") {
        setChats(e.data.chats);
      }
    };

    window.addEventListener("message", listener);
    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  const createChatRoom = (e: any) => {
    e.preventDefault();
    post("tor:createChat", {
      name: e.target.name.value,
      private: privateChat,
    }).then(() => {
      setAddChat(false);
      setCreateChat(false);
    });
  };

  const openJoinModal = () => {
    post("tor:getPublicChats").then((chats) => {
      setPublicChats(chats);
      setJoinChat(true);
    });
  };

  const openChat = (id: string) => {
    setJoinChat(false);
    setCreateChat(false);
    setAddChat(false);

    setPage("chat", { id });
  };

  const joinChatRoom = (id: string) => {
    post("tor:joinChat", { id }).then((error) => {
      if (error) {
        setError(error);
        return;
      }

      setAddChat(false);
      setJoinChat(false);
    });
  };

  const handleJoin = (e: any) => {
    e.preventDefault();
    joinChatRoom(e.target.room.value);
  };

  return (
    <AppTemplate className="px-5 py-10 flex flex-col">
      <AppHeader className="flex !mb-1 items-center justify-between">
        <p>{locales?.torTitle}</p>
        <div className="cursor-pointer" onClick={() => setPage("profile")}>
          <Avatar
            avatar={account?.avatar}
            name={account?.username}
            className="!w-10 !h-10 !text-sm"
          />
        </div>
      </AppHeader>

      <Splitter />

      <div className="grid gap-1 overflow-auto h-full content-start">
        {chats.length > 0 ? (
          chats.map((chat: IChat) => (
            <Chat key={chat.id} open={openChat} {...chat} />
          ))
        ) : (
          <p className="text-center mt-2">{locales?.noChatsFound}</p>
        )}
      </div>

      <Tooltip title="Create Chat" placement="top">
        <button
          onClick={() => setAddChat(true)}
          className="absolute text-lg bottom-10 right-4 rounded-full w-14 h-14 flex items-center justify-center focus:ring transition-all bg-purple-500"
        >
          <FaPlus />
        </button>
      </Tooltip>

      {/* add modal */}
      <Modal isOpen={addChat} close={() => setAddChat(false)}>
        <p className="text-xl text-center mb-2">{locales?.torTitle}</p>
        <p className="text-center opacity-80 mb-3">{locales?.joinOrCreate}</p>
        <div className="grid grid-cols-2 gap-2">
          <button className="btn-2 bg-purple-500" onClick={openJoinModal}>
            {locales?.join}
          </button>
          <button className="btn" onClick={() => setCreateChat(true)}>
            {locales?.create}
          </button>
        </div>
      </Modal>

      {/* join modal */}
      <Modal isOpen={joinChat} close={() => setJoinChat(false)}>
        <form className="grid gap-1" onSubmit={handleJoin}>
          <p className="text-sm mb-1">{locales?.publicChats}</p>
          <div className="grid gap-1 max-h-[150px] overflow-auto">
            {publicChats.length > 0 ? (
              publicChats.map((chat: IChat) => (
                <div
                  key={chat.id + ":public"}
                  onClick={() => joinChatRoom(chat.id)}
                  className="flex items-center gap-2 w-full p-2 select-none rounded-md dark:bg-white bg-black hover:!bg-opacity-10 !bg-opacity-5"
                >
                  <Avatar
                    name={chat.name}
                    avatar={chat.icon}
                    className="!w-7 !h-7 !text-xs"
                  />
                  <p>{chat.name}</p>
                </div>
              ))
            ) : (
              <p className="text-center text-sm">{locales?.noChatsFound}</p>
            )}
          </div>

          <Splitter />

          <label>{locales?.chatId}</label>
          <input className="input" name="room" required />

          {error && <p className="text-center text-red-500 py-2">{error}</p>}

          <button className="btn-2 bg-purple-500 my-1" type="submit">
            {locales?.join}
          </button>
          <button
            onClick={() => setJoinChat(false)}
            type="button"
            className="dark:text-gray-400 text-black font-medium"
          >
            {locales?.goBack}
          </button>
        </form>
      </Modal>

      {/* create modal */}
      <Modal isOpen={createChat} close={() => setCreateChat(false)}>
        <form className="grid gap-1" onSubmit={createChatRoom}>
          <label>{locales?.name}</label>
          <input
            className="input"
            name="name"
            minLength={2}
            maxLength={24}
            required
          />

          <Splitter />

          <MenuSwitch
            label={locales?.private}
            icon={<FaUserSecret />}
            color={"bg-purple-500"}
            checked={privateChat}
            onChange={(e) => setPrivate(e.target.checked)}
          />

          <Splitter />
          <button type="submit" className="btn-2 bg-purple-500 mb-1">
            {locales?.create}
          </button>
          <button
            onClick={() => setCreateChat(false)}
            type="button"
            className="dark:text-gray-400 text-black font-medium"
          >
            {locales?.goBack}
          </button>
        </form>
      </Modal>
    </AppTemplate>
  );
};

interface IChat {
  id: string;
  name: string;
  icon?: string;
  open?: any;
  users: any;
}

const Chat: FC<IChat> = ({ id, name, icon, open, users }) => {
  const { account } = useTor();

  let notifications = 0;
  let muted = false;
  for (let i = 0; i < users.length; i++) {
    const user = users[i];
    if (user.id == account?.id) {
      notifications = user.notifications;
      muted = user.muted;
    }
  }

  return (
    <div
      onClick={() => open(id)}
      className="flex items-center justify-between gap-3 w-full dark:bg-white bg-black !bg-opacity-5 p-2 rounded-md hover:!bg-opacity-10 select-none"
    >
      <div className="flex items-center gap-3">
        <Avatar
          className="!w-10 !h-10 !flex-none !text-sm"
          name={name}
          avatar={icon}
        />
        <p>{name}</p>
      </div>
      {!muted ? (
        notifications > 0 && (
          <p className="bg-red-500 rounded-full px-2 text-sm">
            {notifications}
          </p>
        )
      ) : (
        <p className="bg-red-500 rounded-full px-2 py-1 text-sm">
          <FaBellSlash />
        </p>
      )}
    </div>
  );
};

export default Home;
