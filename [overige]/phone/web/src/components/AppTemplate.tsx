import { AnimatePresence, motion } from "framer-motion";
import React, { FC, useEffect } from "react";
import { useCore } from "../providers/CoreProvider";

interface IAppTemplate {
  bg?: string;
}

const AppTemplate: FC<React.HTMLAttributes<HTMLDivElement> & IAppTemplate> = ({
  children,
  className,
  bg,
}) => {
  const { animations } = useCore();

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: animations ? 0.2 : 0 }}
      style={{ backgroundImage: `url(${bg})` }}
      className={`absolute top-0 left-0 w-full h-full bg-gray-200 text-zinc-900 dark:bg-zinc-900 dark:text-white bg-center bg-cover ${className}`}
    >
      {children}
    </motion.div>
  );
};

export const AppHeader: FC<React.HTMLAttributes<HTMLDivElement>> = ({
  children,
  className,
}) => {
  const { darkMode } = useCore();

  return (
    <header
      className={`${
        darkMode ? "text-white" : "text-zinc-900 dark"
      }text-white text-2xl mb-3 select-none ${className}`}
    >
      {children}
    </header>
  );
};

export const Splitter: FC<React.HTMLAttributes<HTMLDivElement>> = ({
  className,
}) => (
  <hr
    className={`my-2 bg-black dark:bg-white h-[2px] dark:h-auto opacity-10 ${className}`}
  />
);

interface IModal {
  isOpen: boolean;
  close: () => void;
}

export const Modal: FC<IModal> = ({ isOpen, close, children }) => {
  const { animations } = useCore();

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          onClick={() => close()}
          transition={{ type: "keyframes", duration: animations ? 0.15 : 0 }}
          className="absolute flex z-50 bg-opacity-50 bg-black items-center justify-center px-4 w-full h-full top-0 left-0"
        >
          <motion.div
            initial={{ y: -30, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            exit={{ y: 30, opacity: 0 }}
            transition={{ type: "keyframes", duration: animations ? 0.15 : 0 }}
            className="dark:bg-zinc-800 bg-white shadow-md rounded-md p-3 w-full"
            onClick={(e) => e.stopPropagation()}
          >
            {children}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
};

export default AppTemplate;
