import { FC } from "react";
import { FaClipboard, FaCloud, FaComment, FaMailBulk } from "react-icons/fa";
import AppTemplate from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { useCore } from "../../providers/CoreProvider";

const AccountPage: FC<IPageElement> = ({ setPage }) => {
  const { locales } = useCore();

  return (
    <AppTemplate className="px-8 pt-10 pb-5 gap-3 flex flex-col items-center justify-between">
      <div className="flex h-full justify-center items-center flex-col gap-2">
        <FaCloud className="text-6xl" />
        <h1 className="text-2xl px-6 font-normal text-center">
          {locales?.connectCloud}
        </h1>
        <p className="text-gray-400">{locales?.receiveBenefits}:</p>
        <div className="grid gap-1 px-2 w-full">
          <div className="p-2 flex items-center gap-2 dark:bg-white bg-black !bg-opacity-5 rounded-md">
            <div className="p-3 dark:bg-white bg-black !bg-opacity-10 rounded-full">
              <FaComment />
            </div>
            {locales?.messagesTitle}
          </div>
          <div className="p-2 flex items-center gap-2 dark:bg-white bg-black !bg-opacity-5 rounded-md">
            <div className="p-3 dark:bg-white bg-black !bg-opacity-10 rounded-full">
              <FaMailBulk />
            </div>
            {locales?.email}
          </div>
          <div className="p-2 flex items-center gap-2 dark:bg-white bg-black !bg-opacity-5 rounded-md">
            <div className="p-3 dark:bg-white bg-black !bg-opacity-10 rounded-full">
              <FaClipboard />
            </div>
            {locales?.notesTitle}
          </div>
        </div>
        <p className="text-gray-400">{locales?.andMore}</p>
      </div>

      <div className="grid w-full gap-3">
        <button
          onClick={() => setPage("create")}
          className="btn-2 bg-blue-500 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
        >
          {locales?.createAccount}
        </button>
        <button
          onClick={() => setPage("login")}
          className="dark:text-gray-400 text-black font-medium"
        >
          {locales?.login}
        </button>
      </div>
    </AppTemplate>
  );
};

export default AccountPage;
