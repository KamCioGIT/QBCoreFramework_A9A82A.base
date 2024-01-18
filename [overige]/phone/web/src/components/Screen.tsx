import { FC } from "react";
import { useCore } from "../providers/CoreProvider";

interface IScreen {
  background: string;
}

const Screen: FC<IScreen> = ({ children, background }) => {
  const { brightness } = useCore();

  return (
    <div
      className="absolute overflow-hidden bg-black left-[4px] right-[4px] top-[9px] bottom-[5px] rounded-[1rem] bg-cover bg-no-repeat"
      style={{
        backgroundImage: `url(${background})`,
        backgroundPosition: "32% center",
        filter: `brightness(${brightness / 100})`,
      }}
    >
      <div className="bg-black bg-opacity-20 w-full h-full">{children}</div>
    </div>
  );
};

export default Screen;
