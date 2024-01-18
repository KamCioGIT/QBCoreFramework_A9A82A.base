import {
  createContext,
  FC,
  ReactElement,
  useCallback,
  useContext,
  useEffect,
  useState,
} from "react";
import { v4 } from "uuid";
import { post } from "../lib/post";
import { useCore } from "./CoreProvider";

export interface INotification {
  id?: string;
  app: string;
  title: string;
  canClose?: boolean;
  content: string | ReactElement | any;
  duration?: number;
  timeout?: any;
  sound?: string;
  data?: any;
}

interface INotificationContext {
  notify: (notification: INotification) => void;
  removeNotification: (id: string) => void;
  notifications: Array<INotification>;
}

const NotificationContext = createContext<INotificationContext | null>(null);

export const useNotifications = () =>
  useContext(NotificationContext) as INotificationContext;

const NotificationProvider: FC = ({ children }) => {
  const [notifications, setNotifications] = useState<Array<INotification>>([]);
  const { half, setHalf, setOpen, notifications: notifyEnabled } = useCore();

  const addNotification = useCallback((notify: INotification) => {
    const id = v4();

    if (notify.duration && notify.duration === -1) {
      setNotifications((all) => [
        {
          ...notify,
          id,
        },
        ...all,
      ]);
      return;
    }

    setNotifications((all) => [
      {
        ...notify,
        id,
        timeout: setTimeout(
          () => removeNotification(id),
          notify.duration ? notify.duration : 5000
        ),
      },
      ...all,
    ]);
  }, []);

  const removeNotification = (id: string) => {
    setNotifications((curr) => {
      var filerted = curr.filter((n) => n.id !== id);
      return filerted;
    });
    setTimeout(() => {
      window.dispatchEvent(new Event("removeNotification"));
    });
  };

  const notify = (notify: INotification) => {
    if (!notifyEnabled) return;

    var hadToOpen = false;

    setOpen((open: boolean) => {
      if (!open) {
        setHalf(true);
        hadToOpen = true;
        return true;
      }

      return open;
    });

    if (hadToOpen) {
      setTimeout(() => {
        addNotification(notify);
      }, 150);
      return;
    }

    addNotification(notify);
  };

  const onNotificationRemove = () => {
    if (!half) return;
    if (notifications.length > 0) return;

    setTimeout(() => {
      if (half && notifications.length < 1) {
        setOpen(false);
        setHalf(false);
        post("close");
      }
    }, 300);
  };

  useEffect(() => {
    window.addEventListener("removeNotification", onNotificationRemove);

    return () => {
      window.removeEventListener("removeNotification", onNotificationRemove);
    };
  }, [notifications, half]);

  return (
    <NotificationContext.Provider
      value={{ notify, removeNotification, notifications }}
    >
      {children}
    </NotificationContext.Provider>
  );
};

export default NotificationProvider;
