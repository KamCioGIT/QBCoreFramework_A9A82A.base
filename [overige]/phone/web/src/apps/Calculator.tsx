import React, { FC, useState } from "react";
import { Textfit } from "react-textfit";
import AppTemplate from "../components/AppTemplate";

const FORMATTER = Intl.NumberFormat("en-us", { maximumFractionDigits: 0 });
const format = (operand: any) => {
  if (operand === null) return;
  const [integer, decimal] = operand.split(".");
  if (!decimal) return FORMATTER.format(integer);
  return parseFloat(`${FORMATTER.format(integer)}.${decimal}`).toFixed(1);
};

const Calculator = () => {
  const [currentOperand, setCurrentOperand] = useState<string | any>(null);
  const [previousOperand, setPrevOperand] = useState<string | any>(null);
  const [operation, setOperation] = useState<string | any>(null);
  const [complete, setComplete] = useState(false);

  const reset = () => {
    setCurrentOperand(null);
    setPrevOperand(null);
    setOperation(null);
  };

  const addDigit = (digit: string) => {
    if (complete) {
      setComplete(false);
      setCurrentOperand(digit);
      return;
    }

    if (digit === "0" && currentOperand === "0") return;
    if (digit === "." && currentOperand.includes(".")) return;
    setCurrentOperand((curr: string) => `${curr || ""}${digit}`);
  };

  const selectOperation = (op: string) => {
    if (!currentOperand && !previousOperand) return;

    if (!currentOperand) {
      setOperation(op);
      return;
    }

    if (!previousOperand) {
      setOperation(op);
      setPrevOperand(currentOperand);
      setCurrentOperand(null);
      return;
    }

    setOperation(op);
    setPrevOperand(evaluate());
    setCurrentOperand(null);
  };

  const calculate = () => {
    if (!operation || !currentOperand || !previousOperand) return;
    setCurrentOperand(evaluate());
    setPrevOperand(null);
    setOperation(null);
    setComplete(true);
  };

  const evaluate = () => {
    const prev = parseFloat(previousOperand);
    const current = parseFloat(currentOperand);
    if (isNaN(prev) || isNaN(current)) return;
    let answer: any = "";
    switch (operation) {
      case "+":
        answer = prev + current;
        break;
      case "-":
        answer = prev - current;
        break;
      case "×":
        answer = prev * current;
        break;
      case "÷":
        answer = prev / current;
        break;
    }

    return answer.toString();
  };

  return (
    <AppTemplate className="px-5 py-10">
      <div className="w-full relative flex flex-col overflow-hidden items-end justify-end h-[10rem] mb-7">
        <div className="relative w-full text-right">
          <Textfit
            mode="single"
            forceSingleModeWidth={true}
            min={1}
            max={30}
            className="opacity-50"
          >
            {format(previousOperand)} {operation}
          </Textfit>
          <Textfit mode="single" forceSingleModeWidth={true} min={1} max={60}>
            {format(currentOperand)}
          </Textfit>
        </div>
      </div>

      <div className="grid grid-cols-4 gap-2">
        <div
          onClick={reset}
          className="p-5 select-none cursor-pointer col-span-3 grid-cols-3 rounded-md bg-gray-500 flex items-center justify-center text-xl"
        >
          AC
        </div>
        <CalcButton operation={"÷"} onClick={selectOperation} />
        <CalcButton number={"7"} onClick={addDigit} />
        <CalcButton number={"8"} onClick={addDigit} />
        <CalcButton number={"9"} onClick={addDigit} />
        <CalcButton operation={"×"} onClick={selectOperation} />
        <CalcButton number={"4"} onClick={addDigit} />
        <CalcButton number={"5"} onClick={addDigit} />
        <CalcButton number={"6"} onClick={addDigit} />
        <CalcButton operation={"-"} onClick={selectOperation} />
        <CalcButton number={"1"} onClick={addDigit} />
        <CalcButton number={"2"} onClick={addDigit} />
        <CalcButton number={"3"} onClick={addDigit} />
        <CalcButton operation={"+"} onClick={selectOperation} />
        <CalcButton number={"0"} onClick={addDigit} />
        <CalcButton number={"."} onClick={addDigit} />
        <div
          onClick={calculate}
          className="p-5 select-none cursor-pointer rounded-md col-span-2 grid-cols-3 bg-blue-500 flex items-center justify-center text-xl"
        >
          =
        </div>
      </div>
    </AppTemplate>
  );
};

interface ICalcButton {
  number?: string;
  operation?: string;
  onClick?: any;
}

const CalcButton: FC<ICalcButton> = ({ number, operation, onClick }) => {
  return (
    <div
      onClick={() => onClick(operation || number)}
      className={`p-5 transition-all select-none cursor-pointer flex items-center justify-center rounded-md text-xl ${
        operation
          ? "bg-blue-500 bg-opacity-100"
          : "dark:bg-white bg-black !bg-opacity-5 hover:!bg-opacity-10"
      }`}
    >
      {operation ? operation : number}
    </div>
  );
};

export default Calculator;
