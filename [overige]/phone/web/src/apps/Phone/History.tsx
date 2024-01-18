import { differenceInDays, format } from "date-fns";
import { FC, useEffect, useState } from "react";
import { FaPhone, FaPhoneSlash } from "react-icons/fa";
import { v4 } from "uuid";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const HistoryPage: FC<IPageElement> = () => {
  const [calls, setCalls] = useState([]);
  const [delModal, setDelModal] = useState(false);
  const [currentCall, setCurrentCall] = useState<any>(null);
  const { locales } = useCore();

  useEffect(() => {
    post("getCallHistory").then((callHistory: any) => {
      setCalls(callHistory);
    });
  }, []);

  const deleteCallModal = (call: string) => {
    setCurrentCall(call);
    setDelModal(true);
  };

  const handleDelete = () => {
    post("deleteCallLog", { id: currentCall }).then(() => {
      post("getCallHistory").then((callHistory: any) => {
        setCalls(callHistory);
        setCurrentCall(null);
        setDelModal(false);
      });
    });
  };

  return (
    <AppTemplate className="px-5 pt-10 pb-[10rem] absolute">
      <AppHeader>{locales?.callHistory}</AppHeader>
      <Splitter />
      <div className="grid gap-1 h-full content-start overflow-auto">
        {calls.length > 0 ? (
          calls.map((call: ICall, index) => (
            <Call
              key={v4()}
              deleteCall={() => deleteCallModal(call.id)}
              {...call}
            />
          ))
        ) : (
          <div className="text-center mt-2">{locales?.noCallsFound}</div>
        )}
      </div>

      <Modal isOpen={delModal} close={() => setDelModal(false)}>
        <h1 className="text-lg mb-1">{locales?.deleteCall}</h1>
        <div className="flex gap-1 mt-3">
          <button className="btn" onClick={() => setDelModal(false)}>
            {locales?.no}
          </button>
          <button onClick={handleDelete} className="btn-2 bg-red-500">
            {locales?.yes}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface ICall {
  id: string;
  contact: any;
  date: any;
  missed: boolean;
  hidden: boolean;
  deleteCall?: any;
}

const Call: FC<ICall> = ({ contact, date, missed, hidden, deleteCall }) => {
  const handleClick = () => {
    post("call", { number: contact.number });
  };

  const handleContext = () => deleteCall();

  return (
    <div
      onClick={(e) => !hidden && handleClick()}
      onContextMenu={handleContext}
      className="flex justify-between items-center w-full h-fit !bg-opacity-5 bg-black dark:bg-white p-2 rounded-md hover:!bg-opacity-10 cursor-pointer"
    >
      <div className="flex items-center gap-2">
        {missed ? <FaPhoneSlash className="text-red-500" /> : <FaPhone />}
        <p>{contact.name}</p>
      </div>

      <p className="dark:text-slate-400 text-slate-500 text-sm">
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

export default HistoryPage;
