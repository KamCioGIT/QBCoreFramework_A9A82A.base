import { motion } from "framer-motion";
import { useLocation, useNavigate } from "react-router-dom";
import { useCore } from "../providers/CoreProvider";

const HomeBtn = () => {
  const { animations } = useCore();

  const navigate = useNavigate();
  const { pathname } = useLocation();
  const { locked, setLocked } = useCore();

  const handleClick = () => {
    if (pathname === "/lock") {
      if (locked) {
        setLocked(false);
      }
    }

    navigate("/");
  };

  return (
    <motion.div
      initial={{ y: 100 }}
      animate={{ y: 0 }}
      exit={{ y: 100 }}
      transition={{ type: "keyframes", duration: animations ? 0.15 : 0 }}
      onClick={handleClick}
      className="w-full h-[2rem] pb-3 group cursor-pointer z-[40] items-center justify-center flex absolute bottom-0"
    >
      <div
        className={`w-[40%] p-[4px] group-hover:!bg-opacity-100 bg-zinc-900 dark:bg-white !bg-opacity-50 rounded-full ${
          pathname === "/lock" && "!bg-white"
        }`}
      />
    </motion.div>
  );
};

export default HomeBtn;
