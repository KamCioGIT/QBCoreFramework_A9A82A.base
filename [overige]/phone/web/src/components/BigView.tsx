import { AnimatePresence, motion, animations } from "framer-motion";
import { FaTimes } from "react-icons/fa";
import { useCore } from "../providers/CoreProvider";

const BigView = () => {
  const { bigView, setBigView } = useCore();

  return (
    <AnimatePresence>
      {bigView && (
        <motion.div
          onClick={() => setBigView(false)}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ type: "keyframes", duration: animations ? 0.15 : 0 }}
          className="fixed flex flex-col items-center justify-center w-full h-full bg-black left-0 top-0 z-[1000] bg-opacity-50"
        >
          <motion.div
            initial={{ y: -30, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            exit={{ y: 30, opacity: 0 }}
            transition={{
              type: "keyframes",
              duration: animations ? 0.15 : 0,
            }}
            className="items-center flex flex-col justify-center gap-10"
          >
            <button
              onClick={() => setBigView(false)}
              className="rounded-full shrink-0 transition-all w-16 h-16 text-xl !text-white cursor-pointer focus:ring flex items-center justify-center bg-zinc-700"
            >
              <FaTimes />
            </button>
            <img
              className="block object-scale-down w-full h-1/2"
              src={bigView.toString()}
            />
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default BigView;
