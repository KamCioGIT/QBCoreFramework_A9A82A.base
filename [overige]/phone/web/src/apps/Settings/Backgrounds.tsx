import { Skeleton } from "@mui/material";
import { motion } from "framer-motion";
import { FC, useRef, useState } from "react";
import { FaArrowLeft, FaCheck, FaImage } from "react-icons/fa";
import { MenuButton } from ".";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { useCore } from "../../providers/CoreProvider";

const Background: FC<IPageElement> = ({ setPage }) => {
  const [custom, setCustom] = useState(false);
  const { background, changeBackground, backgrounds, locales } = useCore();
  const bgInput = useRef<HTMLInputElement>(null);

  const applyBackground = () => {
    const bg = bgInput?.current?.value;
    if (bg) {
      changeBackground(bg);
      setCustom(false);
    }
  };

  return (
    <AppTemplate className="pt-10 pb-[9rem] px-5 absolute">
      <AppHeader className="flex gap-2">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p>{locales?.background}</p>
      </AppHeader>

      <MenuButton
        icon={<FaImage />}
        onClick={() => setCustom(true)}
        color="bg-blue-500"
      >
        {locales?.customBackground}
      </MenuButton>

      <Splitter />

      <div className="grid grid-cols-2 content-start gap-2 w-full h-full overflow-auto">
        {backgrounds.length > 0 &&
          !backgrounds.includes(background.substring(14)) && (
            <BG image={background} current={true} />
          )}
        {backgrounds.map((bg: any, index: number) => (
          <BG
            key={"bg" + index}
            image={"./backgrounds/" + bg}
            current={"./backgrounds/" + bg === background}
          />
        ))}
      </div>

      <Modal isOpen={custom} close={() => setCustom(false)}>
        <label>{locales?.backgroundURL}</label>
        <input
          className="w-full mt-1 rounded-sm !bg-opacity-5 bg-black dark:bg-white p-1 text-zinc-900 dark:text-white px-2 dark:placeholder:text-white placeholder:!text-opacity-30 focus:ring-2 focus:bg-opacity-10 hover:bg-opacity-10 transition-all ring-blue-400 outline-none font-medium"
          placeholder=".(png|jpeg|gif)"
          ref={bgInput}
        />
        <div className="grid gap-1 mt-3">
          <button className="btn" onClick={applyBackground}>
            {locales?.apply}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface IBG {
  image: any;
  current: boolean;
}

const BG: FC<IBG> = ({ image, current }) => {
  const [loading, setLoading] = useState(true);
  const { changeBackground } = useCore();

  return (
    <>
      {loading ? (
        <>
          <img
            src={image}
            onLoad={() => setTimeout(() => setLoading(false), 300)}
            className="hidden"
          />
          <Skeleton
            variant="rectangular"
            height={"200px"}
            className="w-full rounded-md !bg-slate-400 !bg-opacity-75"
          />
        </>
      ) : (
        <div
          onClick={() => !current && changeBackground(image)}
          className="relative flex items-center justify-center h-[200px]"
        >
          <motion.img
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            src={image}
            className={`rounded-lg absolute left-0 top-0 w-full object-center object-cover h-full shadow-xl ${
              current
                ? "brightness-50 cursor-default"
                : "brightness-100 cursor-pointer"
            }`}
          />
          {current && (
            <div className="p-4 bg-blue-500 !text-white absolute rounded-full">
              <FaCheck className="text-2xl " />
            </div>
          )}
        </div>
      )}
    </>
  );
};

export default Background;
