import { TextareaAutosize, Tooltip } from "@mui/material";
import { differenceInDays, format } from "date-fns";
import { AnimatePresence, motion } from "framer-motion";
import { FC, useEffect, useRef, useState } from "react";
import {
  FaArrowLeft,
  FaBell,
  FaBellSlash,
  FaCamera,
  FaCrown,
  FaEllipsisV,
  FaLink,
  FaPencilAlt,
  FaSignOutAlt,
  FaTimes,
  FaTrash,
  FaUserSecret,
} from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import { v4 } from "uuid";
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
import { PicModal } from "../Twitter";

const Chat: FC<IPageElement> = ({ args, setPage }) => {
  const location: any = useLocation();
  const navigate = useNavigate();
  const { setBigView, locales } = useCore();
  const [info, setInfo] = useState<any>(null);
  const [chat, setChat] = useState<any>(null);
  const [sideMenu, setSideMenu] = useState(false);
  const [editModal, setEditModal] = useState(false);
  const [delModal, setDelModal] = useState(false);
  const [muted, setMuted] = useState(false);
  const [privateChat, setPrivateChat] = useState(false);
  const [images, setImages] = useState(
    location?.state?.images ? location?.state?.images : []
  );
  const [cameraModal, setCameraModal] = useState(false);

  const msgBox = useRef<any>(null);
  const chatBox = useRef<any>(null);
  const { account } = useTor();

  useEffect(() => {
    if (location?.state?.images) {
      msgBox.current.value = location?.state?.data?.msg;
    }

    post("tor:getChat", { id: args.id }).then((info: any) => {
      setInfo(info.chat);
      setChat(info.chat.feed);
      setMuted(info?.muted);
      setPrivateChat(info.chat.private);
      setTimeout(() => {
        if (chatBox.current) {
          chatBox.current!.scrollTop = chatBox.current!.scrollHeight;
        }
      });
    });

    const listener = (e: any) => {
      if (e.data.type === `tor:refreshChat:${args.id}`) {
        if (!e.data.chat) {
          setPage("main");
          return;
        }

        post("tor:markRead", { id: args.id });

        setChat(e.data.chat.feed);
        setInfo(e.data.chat);
        setTimeout(() => {
          if (chatBox.current) {
            chatBox.current!.scrollTop = chatBox.current!.scrollHeight;
          }
        });
      }
    };

    window.addEventListener("message", listener);
    return () => {
      location.state = null;
      window.removeEventListener("message", listener);
    };
  }, [args, chatBox]);

  const onPress = (evt: any) => {
    if (evt.key == "Enter") {
      evt.preventDefault();
      sendMessage();
    }
  };

  const sendMessage = () => {
    if (msgBox.current?.value.length > 0 || images.length > 0) {
      post("tor:sendMessage", {
        id: v4(),
        chat: args.id,
        content: msgBox.current?.value,
        images,
      });
      msgBox.current.value = "";
      setImages([]);
    }
  };

  const leaveChat = () => {
    post("tor:leaveChat", { id: args.id }).then(() => {
      setPage("main");
    });
  };

  const deleteChat = () => {
    post("tor:deleteChat", { id: args.id });
  };

  const openEditModal = () => {
    setPrivateChat(info?.private);
    setEditModal(true);
  };

  const toggleNotifications = () => {
    setMuted(!muted);
    post("tor:muteChat", { id: args.id, toggle: muted });
  };

  const editChat = (e: any) => {
    e.preventDefault();

    post("tor:editChat", {
      id: args.id,
      name: e.target.chatName.value,
      icon: e.target.icon.value,
      wallpaper: e.target.wallpaper.value,
      private: privateChat,
    }).then(() => {
      setEditModal(false);
    });
  };

  const copyInvite = () => {
    const el = document.createElement("textarea");
    el.value = info?.id;
    document.body.appendChild(el);
    el.select();
    document.execCommand("copy");
    document.body.removeChild(el);
  };

  const takePic = () => {
    navigate("/camera", {
      state: {
        images,
        app: "tor",
        data: { chat: args.id, msg: msgBox.current.value },
      },
    });
  };

  const selectPic = (img: string) => {
    setImages((images: any) => [...images, img]);
    setCameraModal(false);
  };

  const deleteImage = (e: any, index: number) => {
    e.stopPropagation();
    setImages((images: any) =>
      images.filter((_val: any, i: number) => i !== index)
    );
  };

  return (
    <AppTemplate className="flex flex-col">
      <AppHeader className="flex !mb-0 gap-3 justify-between items-center px-5 pt-10 pb-2 dark:bg-white bg-black !bg-opacity-5 dark:border-white border-black border !border-opacity-5">
        <div className="flex gap-3 items-center overflow-hidden">
          <button
            onClick={() => setPage("main")}
            className="back-btn !flex-none"
          >
            <FaArrowLeft />
          </button>

          <Tooltip title={info?.name ? info?.name : ""}>
            <div className="overflow-hidden text-ellipsis whitespace-nowrap">
              {info?.name}
            </div>
          </Tooltip>
        </div>

        <div className="flex items-center gap-1">
          <Tooltip title={muted ? locales?.unmute : locales?.mute}>
            <button
              className={`back-btn2 !flex-none ${
                muted
                  ? "!bg-red-500 !bg-opacity-100"
                  : "!bg-white !bg-opacity-5"
              }`}
              onClick={toggleNotifications}
            >
              {muted ? <FaBellSlash /> : <FaBell />}
            </button>
          </Tooltip>
          <button
            className="back-btn !flex-none"
            onClick={() => setSideMenu(true)}
          >
            <FaEllipsisV />
          </button>
        </div>
      </AppHeader>

      <div
        className="overflow-hidden h-full"
        style={{
          backgroundImage: `url(${info?.wallpaper})`,
          backgroundPosition: "center",
          backgroundSize: "cover",
        }}
      >
        <div
          ref={chatBox}
          className="overflow-auto grid gap-1 content-start h-full pb-2 pt-1 dark:bg-zinc-800 bg-white !bg-opacity-40"
        >
          {chat?.map((msg: IMessage) => (
            <Message key={msg.id} {...msg} />
          ))}
        </div>
      </div>

      <div className="w-full h-fit pb-12 pt-2 px-5 flex dark:bg-white bg-black !bg-opacity-5 dark:border-white border-black border !border-opacity-5">
        <div className="h-full flex-grow w-full">
          {images.length > 0 && (
            <div className="grid grid-cols-3 gap-1 mb-2">
              {images.map((img: string, index: number) => (
                <div
                  key={v4()}
                  onClick={() => setBigView(img)}
                  className="w-full h-[50px] relative rounded-md bg-cover bg-center"
                  style={{ backgroundImage: `url(${img})` }}
                >
                  <button
                    onClick={(e) => deleteImage(e, index)}
                    className="w-[20px] h-[20px] flex items-center justify-center bg-black text-white bg-opacity-75 rounded-full absolute right-1 top-1 text-xs"
                  >
                    <FaTimes />
                  </button>
                </div>
              ))}
            </div>
          )}
          <div className="flex gap-1">
            <Tooltip title={locales?.camera} placement="top">
              <button
                onClick={() => setCameraModal(true)}
                className="btn h-fit !w-fit"
              >
                <FaCamera />
              </button>
            </Tooltip>
            <TextareaAutosize
              className="input resize-none !transition-shadow "
              maxRows={5}
              maxLength={244}
              placeholder={`${locales?.message} ${info?.name}`}
              ref={msgBox}
              onKeyDown={onPress}
            />
          </div>
        </div>
      </div>

      <Modal isOpen={cameraModal} close={() => setCameraModal(false)}>
        <PicModal takePic={takePic} selectPic={selectPic} />
      </Modal>

      <SideMenu open={sideMenu} close={() => setSideMenu(false)}>
        <div className="px-3 flex flex-col h-full pb-12 pt-10">
          <div className="flex justify-between gap-1">
            <div className="flex items-center gap-1">
              {info?.owner === account?.id && (
                <>
                  <Tooltip title={locales?.delete}>
                    <button
                      onClick={() => setDelModal(true)}
                      className="back-btn text-red-500"
                    >
                      <FaTrash />
                    </button>
                  </Tooltip>
                  <Tooltip title={locales?.edit}>
                    <button onClick={openEditModal} className="back-btn">
                      <FaPencilAlt />
                    </button>
                  </Tooltip>
                </>
              )}
              {info?.owner !== account?.id && (
                <Tooltip title={locales?.leaveChat}>
                  <button onClick={leaveChat} className="back-btn">
                    <FaSignOutAlt />
                  </button>
                </Tooltip>
              )}
              <Tooltip title={locales?.copyInvite}>
                <button onClick={copyInvite} className="back-btn">
                  <FaLink />
                </button>
              </Tooltip>
            </div>

            <button className="back-btn" onClick={() => setSideMenu(false)}>
              <FaTimes />
            </button>
          </div>
          <Splitter />
          <p className="text-sm mb-1">
            {locales?.members} - {info?.users.length}
          </p>
          <div className="grid gap-1 content-start overflow-auto h-full">
            {info?.users.map((user: any) => (
              <div
                key={user.id}
                className="flex select-none items-center gap-2 hover:dark:bg-white hover:bg-black !bg-opacity-5 p-1 rounded-md"
              >
                <Avatar
                  className="!w-9 !h-9 !text-sm"
                  name={user.name}
                  avatar={user.avatar}
                />
                <div className="flex items-center gap-2">
                  {user.name}
                  {user.id == info?.owner && (
                    <div>
                      <Tooltip title={locales?.owner}>
                        <div>
                          <FaCrown className="text-yellow-500" />
                        </div>
                      </Tooltip>
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>
      </SideMenu>

      <Modal isOpen={editModal} close={() => setEditModal(false)}>
        <form className="grid gap-1" onSubmit={editChat}>
          <label>{locales?.name}</label>
          <input
            defaultValue={info?.name}
            name="chatName"
            className="input"
            maxLength={24}
            minLength={2}
            required
          />

          <label>{locales?.icon}</label>
          <input defaultValue={info?.icon} name="icon" className="input" />

          <label>{locales?.wallpaper}</label>
          <input
            defaultValue={info?.wallpaper}
            name="wallpaper"
            className="input"
          />

          <Splitter />

          <MenuSwitch
            label={locales?.private}
            icon={<FaUserSecret />}
            color={"bg-purple-500"}
            checked={privateChat}
            onChange={(e) => setPrivateChat(e.target.checked)}
          />

          <Splitter />
          <button type="submit" className="btn-2 bg-purple-500 mb-1">
            {locales?.saveChanges}
          </button>
          <button
            onClick={() => setEditModal(false)}
            type="button"
            className="dark:text-gray-400 text-black font-medium"
          >
            {locales?.close}
          </button>
        </form>
      </Modal>

      <Modal isOpen={delModal} close={() => setDelModal(false)}>
        <div className="grid gap-1">
          <button onClick={deleteChat} className="btn-2 bg-red-500 mb-1">
            {locales?.deleteChat}
          </button>
          <button
            onClick={() => setDelModal(false)}
            type="button"
            className="dark:text-gray-400 text-black font-medium"
          >
            {locales?.close}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface IMessage {
  id: string;
  content: string;
  from: any;
  date: any;
  images: Array<string>;
}

const Message: FC<IMessage> = ({ content, from, date, images }) => {
  const { setBigView } = useCore();

  return (
    <div className="flex w-full h-fit px-5 py-1 gap-3 hover:dark:bg-white hover:bg-black !bg-opacity-5">
      <Avatar
        avatar={from.avatar}
        name={from.name}
        className="!w-10 !h-10 mt-1 flex-none !text-sm"
      />
      <div className="grid w-full items-center">
        <div className="flex gap-2 w-full items-center justify-between">
          <p>{from.name}</p>
          <p className="text-xs dark:text-zinc-300 text-zinc-700">
            {format(
              new Date(date * 1000),
              differenceInDays(new Date(), new Date(date * 1000)) < 1
                ? "HH:mm"
                : "dd/LL/yyyy"
            )}
          </p>
        </div>
        <div className="font-normal w-full break-all">
          <p>{content}</p>
          {images && images.length > 0 && (
            <div
              className={`grid min-w-[200px] ${
                images.length < 2 ? "grid-cols-1" : "grid-cols-2"
              }  gap-1 mt-2`}
            >
              {images.map((img: string) => (
                <div
                  key={v4()}
                  onClick={() => setBigView(img)}
                  className={`w-full ${
                    images.length < 2 ? "h-[120px]" : "h-[50px]"
                  } relative rounded-md bg-cover bg-center`}
                  style={{ backgroundImage: `url(${img})` }}
                />
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

interface ISideMenu {
  open: boolean;
  close: any;
}

const SideMenu: FC<ISideMenu> = ({ open, close, children }) => {
  const { animations } = useCore();

  return (
    <AnimatePresence>
      {open && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          onClick={close}
          transition={{ type: "keyframes", duration: animations ? 0.15 : 0 }}
          className="w-full h-full absolute bg-black bg-opacity-50"
        >
          <motion.div
            initial={{ x: 200 }}
            animate={{ x: 0 }}
            exit={{ x: 200 }}
            onClick={(e) => e.stopPropagation()}
            transition={{ type: "keyframes", duration: animations ? 0.2 : 0 }}
            className="absolute h-full w-[65%] dark:bg-zinc-800 bg-zinc-300 border-white border !border-opacity-5 right-0"
          >
            {children}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default Chat;
