import { TextareaAutosize, Tooltip } from "@mui/material";
import { differenceInDays, format } from "date-fns";
import { FC, useEffect, useRef, useState } from "react";
import {
  FaArrowLeft,
  FaCamera,
  FaLocationArrow,
  FaPaperPlane,
  FaTimes,
} from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import { v4 } from "uuid";
import AppTemplate, { AppHeader, Modal } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import { PicModal } from "../Twitter";

const ChatPage: FC<IPageElement> = ({ setPage, args }) => {
  const location: any = useLocation();
  const navigate = useNavigate();

  const [chat, setChat] = useState<any>([]);
  const [contact, setContact] = useState<any>(null);
  const msgBox = useRef<any>(null);
  const [cameraModal, setCameraModal] = useState(false);
  const [options, setOptions] = useState(false);
  const [currentMsg, setCurrentMsg] = useState<any>(null);
  const [images, setImages] = useState(
    location?.state?.images ? location?.state?.images : []
  );
  const { setBigView, locales } = useCore();
  const chatRef: any = useRef(null);

  const [gps, setGps] = useState(false);

  useEffect(() => {
    post("getChat", { number: args?.number }).then((data: any) => {
      setChat(data.chat);
      setContact(data.contact);
      setTimeout(() => {
        if (chatRef.current) {
          chatRef.current!.scrollTop = chatRef.current!.scrollHeight;
        }
      });
    });
  }, [args, chatRef]);

  useEffect(() => {
    if (location?.state?.images) {
      msgBox.current.value = location?.state?.data?.msg;
    }

    const listener = (evt: any) => {
      if (evt.data.type === `refreshChat:${args.number}`) {
        post("getChat", { number: args.number }).then((data: any) => {
          setChat(data.chat);
          setContact(data.contact);
          setTimeout(() => {
            if (chatRef.current) {
              chatRef.current!.scrollTop = chatRef.current!.scrollHeight;
            }
          });
        });
      }
    };

    window.addEventListener("message", listener);

    return () => {
      location.state = null;
      window.removeEventListener("message", listener);
    };
  }, [chatRef]);

  const onPress = (evt: any) => {
    if (evt.key == "Enter") {
      evt.preventDefault();
      sendMessage();
    }
  };

  const sendMessage = () => {
    if (msgBox.current?.value.length > 0 || images.length > 0) {
      post("sendMessage", {
        id: v4(),
        msg: msgBox.current?.value,
        number: args.number,
        gps,
        images,
      });
      msgBox.current.value = "";
      setImages([]);
    }
  };

  const takePic = () => {
    navigate("/camera", {
      state: {
        images,
        app: "messages",
        data: {
          msg: msgBox.current.value,
          number: args.number,
        },
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
      images.filter((val: any, i: number) => i !== index)
    );
  };

  const openOptions = (e: any, msg: any) => {
    setCurrentMsg(msg);
    setOptions(true);
  };

  const delMessage = () => {
    post("delMessage", { id: currentMsg.id, target: args.number });
    setCurrentMsg(null);
    setOptions(false);
  };

  const goToContact = () => {
    if (!contact?.exists) {
      navigate("/contacts", { state: { adding: true, number: args.number } });
    } else {
      navigate("/contacts", { state: { adding: false, contact: contact } });
    }
  };

  return (
    <AppTemplate>
      <AppHeader className="dark:bg-zinc-800 bg-slate-100 fixed w-full top-0 pt-10 mb-0 flex gap-2 px-5 pb-3 border-b dark:border-white border-black !border-opacity-10">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p
          className="hover:text-blue-500 cursor-pointer text-ellipsis whitespace-nowrap overflow-hidden"
          onClick={goToContact}
        >
          {contact?.name}
        </p>
      </AppHeader>

      <div className="flex flex-col h-full w-full pt-[5.5rem]">
        <div className="overflow-auto h-full px-1">
          <div
            ref={chatRef}
            className="h-full px-4 flex gap-2 flex-col overflow-auto py-2"
          >
            {chat?.map((msg: any) => (
              <Message
                key={msg.id}
                msg={msg.msg}
                id={msg.id}
                gps={msg.gps}
                images={msg.images}
                date={msg.timestamp}
                sent={msg.from !== args.number}
                click={openOptions}
              />
            ))}
          </div>
        </div>

        <div className="h-fit dark:bg-zinc-800 bg-slate-100 pb-11 border-t dark:border-white border-black !border-opacity-10">
          <div className="h-full px-5 pt-3 flex-grow w-full">
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
              <Tooltip title={locales?.location} placement="top">
                <button
                  onClick={() => setGps(!gps)}
                  className={`btn-2 h-fit !w-fit ${
                    gps
                      ? "bg-blue-500 !bg-opacity-100"
                      : "bg-white !bg-opacity-5"
                  }`}
                >
                  <FaLocationArrow />
                </button>
              </Tooltip>
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
                placeholder={locales?.enterMessage}
                ref={msgBox}
                onKeyDown={onPress}
                maxLength={244}
              />
            </div>
          </div>
        </div>
      </div>

      <Modal isOpen={cameraModal} close={() => setCameraModal(false)}>
        <PicModal takePic={takePic} selectPic={selectPic} />
      </Modal>

      <Modal isOpen={options} close={() => setOptions(false)}>
        <div className="grid gap-1">
          <button className="btn" onClick={delMessage}>
            {locales?.deleteMsg}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface IMessage {
  id: string;
  msg: string;
  sent: boolean;
  gps: any;
  images: Array<string>;
  click: any;
  date: any;
}

const Message: FC<IMessage> = ({ id, sent, msg, gps, images, click, date }) => {
  const { setBigView } = useCore();

  const setWaypoint = () => {
    post("setWaypoint", { coords: gps });
  };

  return (
    <div
      className={`flex flex-col w-full ${
        sent
          ? "self-end items-end justify-end"
          : "self-start items-start justify-start"
      }`}
    >
      <div
        onContextMenu={(e) => sent && click(e, { id })}
        className={`rounded-md break-words max-w-full ${
          sent
            ? "dark:bg-blue-500 bg-blue-400"
            : "bg-black dark:bg-white !bg-opacity-5"
        } w-fit p-2 px-3`}
      >
        {msg}
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
        {gps && (
          <button className="btn mt-2 text-sm" onClick={setWaypoint}>
            Set Waypoint
          </button>
        )}
      </div>
      <p className="text-xs dark:text-gray-200 text-gray-500 mt-1">
        {format(
          new Date(date * 1000),
          differenceInDays(new Date(), new Date(date * 1000)) < 1
            ? "HH:mm"
            : "dd/LL/yyyy"
        )}
      </p>
    </div>
  );
};

export default ChatPage;
