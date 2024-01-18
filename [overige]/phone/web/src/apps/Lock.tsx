import { format } from "date-fns";
import { motion } from "framer-motion";
import { useState, useEffect } from "react";
import { FaCamera, FaPhone } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import { useCore } from "../providers/CoreProvider";

const Lock = () => {
  const { animations, setLocked } = useCore();
  const [date, setDate] = useState<any>(new Date());
  const [intervalId, setIntervalId] = useState<any>(null);
  const navigate = useNavigate();

  useEffect(() => {
    return () => {
      clearInterval(intervalId);
    };
  }, [intervalId]);

  useEffect(() => {
    let id = setInterval(() => {
      setDate(new Date());
    }, 5000);

    setIntervalId(id);
  }, []);

  const openCam = () => {
    setLocked(false);
    navigate("/camera");
  };

  const openDial = () => {
    setLocked(false);
    navigate("/phone");
  };

  return (
    <motion.div
      initial={{ y: 0 }}
      animate={{ y: 0 }}
      exit={{ y: -200, opacity: 0 }}
      transition={{ duration: animations ? 0.2 : 0 }}
      className="flex flex-col select-none w-full h-full pt-[50px] items-center text-white"
    >
      <div className="text-center">
        <div className="text-[75px]">{date && format(date, "HH:mm")}</div>
        <div className="text-xl font-normal">
          {date && format(date, "EEEE d MMMM")}
        </div>
      </div>
      <div className="bottom-12 flex justify-between items-center w-full px-5 absolute">
        <button onClick={openDial} className="back-btn !w-12 !h-12 !text-xl">
          <FaPhone />
        </button>
        <button onClick={openCam} className="back-btn !w-12 !h-12 !text-xl">
          <FaCamera />
        </button>
      </div>
    </motion.div>
  );
};

export default Lock;
