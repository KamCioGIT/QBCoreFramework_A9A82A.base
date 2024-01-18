import React, { FC } from "react";
import { FaUser } from "react-icons/fa";

interface IAvatar {
  name?: string;
  avatar?: string | null;
}

const Avatar: FC<IAvatar & React.HTMLAttributes<HTMLDivElement>> = ({
  name,
  avatar,
  className,
}) => {
  let formatted = null;

  if (name) {
    const first = name.split(" ")[0][0];
    formatted = first;
    if (name.split(" ")[1]) {
      formatted = first + name.split(" ")[1][0];
    }
  }

  return (
    <div
      className={`w-20 h-20 select-none uppercase flex items-center justify-center ${
        !avatar && "bg-slate-500"
      } text-2xl rounded-full bg-center bg-cover !text-white ${className}`}
      style={{ backgroundImage: `url(${avatar})` }}
    >
      {!avatar && !formatted ? (
        <FaUser className="!text-[1rem] !text-white" />
      ) : (
        !avatar && formatted
      )}
    </div>
  );
};

export default Avatar;
