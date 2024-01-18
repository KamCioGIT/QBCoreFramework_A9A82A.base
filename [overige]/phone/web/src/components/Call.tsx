import { FC, useEffect, useState } from "react";
import { FaCheck, FaTimes } from "react-icons/fa";
import { useCore } from "../providers/CoreProvider";
import { playSound } from "../lib/sound";
import {
  INotification,
  useNotifications,
} from "../providers/NotificationProvider";
import { post } from "../lib/post";

interface ICall {
  notify: INotification;
  incoming: boolean;
  callid: number;
}

const Call: FC<ICall> = ({ notify, incoming, callid }) => {
  const [connected, setConnected] = useState(false);
  const [declined, setDeclined] = useState(false);
  const [interval, setIntervalId]: any = useState(null);
  const [timer, setTimer]: any = useState(null);

  const { removeNotification } = useNotifications();
  const { ringtone, volume, locales } = useCore();
  const [status, setStatus] = useState(
    incoming ? locales?.incomingCall : locales?.calling
  );

  const acceptCall = async (ser?: boolean) => {
    var time = 0;
    if (connected) return;

    setConnected(true);
    setStatus(locales?.connecting);

    if (ser) {
      post("answerCall", { callid });
    }

    // start timer
    setStatus(new Date(time * 1000).toISOString().substring(14, 19));
    let timer = setInterval(() => {
      if (declined) return;

      time += 1;
      setStatus(new Date(time * 1000).toISOString().substring(14, 19));
    }, 1000);
    setIntervalId(timer);
  };

  const declineCall = async (ser?: boolean) => {
    if (declined) return;

    // clear timer
    clearInterval(interval);
    setIntervalId(null);

    setTimeout(() => {
      setConnected(false);
      setDeclined(true);

      if (ser) {
        post("endCall", { callid });
      }

      setStatus(locales?.disconnected);

      // remove notification
      setTimeout(() => {
        removeNotification(notify.id!);
      }, 500);
    }, 50);
  };

  useEffect(() => {
    if (!connected && !declined) {
      var time = setTimeout(() => {
        declineCall();
        post("endCall", { missed: incoming, callid });
      }, 30000);
      setTimer(time);
    } else {
      clearTimeout(timer);
      setTimer(null);
    }

    return () => {
      clearInterval(timer);
      setTimer(null);
    };
  }, [connected, declined, incoming, callid]);

  useEffect(() => {
    const sound: any = playSound(
      incoming
        ? ringtone
          ? ringtone.file
          : "./ringtones/rick.mp3"
        : "calling.mp3"
    );
    const playPromise = sound.play();
    sound.loop = true;
    sound.volume = volume / 100;

    if (connected || declined) {
      playPromise.then(() => {
        sound.pause();
      });
    }

    return () => {
      playPromise.then(() => {
        sound.pause();
      });
    };
  }, [ringtone, connected, declined, incoming, volume]);

  useEffect(() => {
    const listener = (e: any) => {
      if (e.data.type === `answerCall:${callid}`) {
        acceptCall(false);
      } else if (e.data.type === `endCall:${callid}`) {
        declineCall(false);
      } else if (e.data.type === "answerCallBtn") {
        if (incoming) {
          acceptCall(true);
        }
      } else if (e.data.type === "declineCallBtn") {
        declineCall(true);
      }
    };

    window.addEventListener("message", listener);
    return () => {
      window.removeEventListener("message", listener);
    };
  }, [interval, connected, declined, incoming, callid]);

  return (
    <div className="flex items-center justify-between">
      <p>{status}</p>
      <div className="flex gap-1">
        {!connected && !declined && incoming && (
          <button
            onClick={() => acceptCall(true)}
            className="w-6 h-6 text-xs transition-all focus:ring outline-none bg-green-500 rounded-full flex items-center justify-center cursor-pointer"
          >
            <FaCheck />
          </button>
        )}
        {!declined && (
          <button
            onClick={() => declineCall(true)}
            className="w-6 h-6 text-xs transition-all focus:ring outline-none bg-red-500 rounded-full flex items-center justify-center cursor-pointer"
          >
            <FaTimes />
          </button>
        )}
      </div>
    </div>
  );
};

export default Call;
