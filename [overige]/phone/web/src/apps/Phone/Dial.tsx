import { FC, ReactElement, useState } from "react";
import { FaBackspace, FaPhone } from "react-icons/fa";
import AppTemplate from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const DialPage: FC<IPageElement> = () => {
  const numbers = [];
  const [number, setNumber] = useState("");
  const { locales } = useCore();

  const addNumber = (num: number) => {
    if (number.length < 11) {
      setNumber((nums) => (nums += num));
    }
  };

  const removeNumber = () => {
    setNumber((nums) => nums.substring(0, nums.length - 1));
  };

  const callNumber = () => {
    post("call", { number });
  };

  for (var i = 1; i <= 9; i++) {
    numbers.push(
      <Number key={i} number={i} onClick={(num) => addNumber(num)} />
    );
  }

  numbers.push(
    <Number
      key={"del"}
      number={<FaBackspace />}
      onClick={removeNumber}
      color="!bg-red-500 !bg-opacity-100 hover:!bg-opacity-75"
    />
  );
  numbers.push(<Number onClick={() => addNumber(0)} key={0} number={0} />);
  numbers.push(
    <Number
      key={"call"}
      onClick={callNumber}
      number={<FaPhone />}
      color="!bg-green-600 !bg-opacity-100 hover:!bg-opacity-75"
    />
  );

  return (
    <AppTemplate className="px-5 pt-10 absolute">
      <div className="h-full flex flex-col items-center pt-[4rem] gap-[4rem]">
        <div className="text-3xl h-[1rem] flex items-center select-none">
          {number ? (
            number
          ) : (
            <p className="opacity-30 text-2xl">{locales?.enterNumber}</p>
          )}
        </div>
        <div className="flex flex-wrap justify-center gap-5">{numbers}</div>
      </div>
    </AppTemplate>
  );
};

interface INumber {
  number: number | string | ReactElement;
  color?: string;
  onClick: (num: any) => void;
}

const Number: FC<INumber> = ({ number, color, onClick }) => {
  return (
    <div
      onClick={() => onClick(number)}
      className={`rounded-full select-none cursor-pointer hover:!bg-opacity-10 bg-black w-16 h-16 flex items-center justify-center dark:bg-white !bg-opacity-5 ${color}`}
    >
      {number}
    </div>
  );
};

export default DialPage;
