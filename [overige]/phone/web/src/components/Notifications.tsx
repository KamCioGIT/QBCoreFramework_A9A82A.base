import { AnimatePresence, motion } from "framer-motion";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { post } from "../lib/post";
import { playSound } from "../lib/sound";
import { useCore } from "../providers/CoreProvider";
import {
  useNotifications,
  INotification,
} from "../providers/NotificationProvider";

const Notifications = () => {
  const { notifications } = useNotifications();

  return (
    <div className="grid gap-1 px-3 top-8 absolute z-30 w-full">
      <AnimatePresence>
        {notifications.map((notification: INotification, index) => (
          <Notification key={notification.id} {...notification} />
        ))}
      </AnimatePresence>
    </div>
  );
};

const Notification = ({
  id,
  app,
  title,
  content,
  sound,
  canClose,
  data,
}: INotification) => {
  const { removeNotification } = useNotifications();
  const { animations, volume, locked } = useCore();
  const navigate = useNavigate();

  const onClick = () => {
    if (data && app) {
      if (locked) {
        removeNotification(id!);
        return;
      }

      if (data.nuiEvent) {
        post(data.nuiEvent, data.args);
      } else {
        navigate(`/${app}`, { state: { data } });
      }

      removeNotification(id!);
    }
  };

  const onContextMenu = () => {
    if (canClose === false) return;
    removeNotification(id!);
  };

  useEffect(() => {
    if (sound) {
      const soundComp: any = playSound(sound);
      soundComp.volume = volume / 100;
    }
  }, [volume, sound]);

  return (
    <motion.div
      layout
      initial={{ y: -100, zIndex: -1, opacity: 0, pointerEvents: "none" }}
      animate={{ y: 0, zIndex: 1, opacity: 1, pointerEvents: "all" }}
      exit={{ y: -100, zIndex: -1, opacity: 0, pointerEvents: "none" }}
      transition={{ type: "keyframes", duration: animations ? 0.25 : 0 }}
      onClick={onClick}
      className="overflow-hidden"
      onContextMenu={onContextMenu}
    >
      <div className="w-full p-2 select-none pointer-events-auto bg-white shadow-lg dark:bg-zinc-700 !bg-opacity-[98%] rounded-lg text-zinc-900 dark:text-white">
        <div className="flex items-center gap-2 relative justify-between mb-[1px] overflow-hidden">
          <div className="flex gap-2 items-center overflow-hidden text-ellipsis max-w-[200px]">
            <img src={`./apps/${app}.svg`} width={"25px"} />
            <p className="text-ellipsis w-full overflow-hidden">{title}</p>
          </div>
          <p className="text-sm absolute right-0 top-0 opacity-80 font-normal">
            just now
          </p>
        </div>
        <div className="w-full relative overflow-hidden">
          {typeof content === "function" ? (
            content({ id })
          ) : (
            <p className="text-ellipsis relative w-fit max-w-[270px] overflow-hidden whitespace-nowrap">
              {content}
            </p>
          )}
        </div>
      </div>
    </motion.div>
  );
};

export default Notifications;
