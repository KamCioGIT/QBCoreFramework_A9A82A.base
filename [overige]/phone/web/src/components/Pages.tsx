import { AnimatePresence, motion } from "framer-motion";
import { FC, useState } from "react";
import { useCore } from "../providers/CoreProvider";

interface IPages {
  page: any;
  pages: any;
  setPage: (page: any) => void;
}

interface IPage {
  name: string;
  Element: new () => React.Component<IPageElement, IPageElement>;
  args: any;
}

export interface IPageElement {
  setPage: (page: any, args?: any) => void;
  args: any;
}

export const Pages: FC<IPages> = ({ pages, page, setPage }) => {
  const { animations } = useCore();

  const handlePageChange = (page: string, args: any) => {
    setTimeout(() => {
      setPage({ page, args });
    }, 50);
  };

  return pages.map(({ name, Element, args }: IPage, index: number) => (
    <AnimatePresence key={name} initial={false}>
      {page.page === name && (
        <motion.div
          initial={{
            x: index < 1 || name === "main" ? -500 : 500,
          }}
          animate={{ x: 0 }}
          exit={{ x: index < 1 || name === "main" ? -500 : 500 }}
          transition={{
            type: "keyframes",
            duration: animations ? 0.25 : 0,
          }}
          className="w-full h-full absolute overflow-hidden"
        >
          <Element
            setPage={handlePageChange}
            args={page.args ? page.args : args && args}
          />
        </motion.div>
      )}
    </AnimatePresence>
  ));
};
