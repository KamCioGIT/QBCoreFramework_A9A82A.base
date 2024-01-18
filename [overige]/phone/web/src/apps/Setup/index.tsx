import AppTemplate from "../../components/AppTemplate";
import { FC, useState } from "react";
import { IPageElement, Pages } from "../../components/Pages";
import AccountPage from "./account";
import {
  FaHandSparkles,
  FaMoon,
  FaPalette,
  FaSpinner,
  FaSun,
} from "react-icons/fa";
import CreatePage from "./create";
import { useCore } from "../../providers/CoreProvider";
import { post } from "../../lib/post";
import { useNavigate } from "react-router-dom";
import LoginPage from "./login";
import { AnimatePresence, motion } from "framer-motion";

const Setup = () => {
  const [page, setPage] = useState({ page: "main" });

  const pages = [
    { name: "main", Element: StartPage },
    { name: "account", Element: AccountPage },
    { name: "create", Element: CreatePage },
    { name: "login", Element: LoginPage },
    { name: "colormode", Element: ColorPage },
    { name: "animations", Element: AnimationsPage },
  ];

  return (
    <AppTemplate>
      <Pages page={page} pages={pages} setPage={setPage} />
    </AppTemplate>
  );
};

const StartPage: FC<IPageElement> = ({ setPage }) => {
  const { locales } = useCore();

  return (
    <AppTemplate className="pt-10 pb-5 px-8 flex items-center flex-col justify-between">
      <div></div>
      <div className="flex items-center flex-col gap-2">
        <AnimatePresence>
          <motion.svg
            width="10000"
            height="67"
            viewBox="0 0 121 47"
            fill={"none"}
            xmlns="http://www.w3.org/2000/svg"
          >
            <motion.path
              d="M88.2966 42.4C88.1595 42.1389 88.0294 41.87 87.9064 41.5933C86.812 42.7745 85.6433 43.7794 84.4004 44.608C82.8004 45.696 80.9764 46.24 78.9284 46.24C76.1124 46.24 74.0164 44.96 72.6404 42.4C72.4974 42.1277 72.3621 41.8468 72.2343 41.5575C71.1716 42.5707 69.8417 43.5235 68.2446 44.416C66.1006 45.632 63.7966 46.24 61.3326 46.24C57.9726 46.24 55.3646 45.328 53.5086 43.504C51.6526 41.68 50.7246 39.184 50.7246 36.016C50.7246 33.808 51.1886 31.76 52.1166 29.872C53.0446 27.952 54.3246 26.432 55.9566 25.312C57.6206 24.192 59.4926 23.632 61.5726 23.632C63.4286 23.632 64.9166 24.192 66.0366 25.312C67.1566 26.4 67.7166 27.888 67.7166 29.776C67.7166 31.984 66.9166 33.888 65.3166 35.488C63.7486 37.056 61.0766 38.304 57.3006 39.232C58.1006 40.704 59.6206 41.44 61.8606 41.44C63.3006 41.44 64.9326 40.944 66.7566 39.952C68.3222 39.0882 69.7056 38.0081 70.9069 36.7118C70.7186 35.4012 70.6244 33.9853 70.6244 32.464C70.6244 28.56 71.1204 24.112 72.1124 19.12C73.1364 14.128 74.6244 9.84001 76.5764 6.256C78.5604 2.672 80.9124 0.880005 83.6324 0.880005C85.1684 0.880005 86.3684 1.60001 87.2324 3.03999C88.1284 4.44801 88.5764 6.48001 88.5764 9.13602C88.5764 12.944 87.5204 17.36 85.4084 22.384C83.2964 27.408 80.4324 32.384 76.8164 37.312C77.0404 38.624 77.4084 39.568 77.9204 40.144C78.4324 40.688 79.1044 40.96 79.9364 40.96C81.2484 40.96 82.4004 40.592 83.3924 39.856C84.2468 39.1945 85.303 38.1414 86.5609 36.6965C86.3741 35.3903 86.2806 33.9794 86.2806 32.464C86.2806 28.56 86.7766 24.112 87.7686 19.12C88.7926 14.128 90.2806 9.84001 92.2326 6.256C94.2166 2.672 96.5686 0.880005 99.2886 0.880005C100.825 0.880005 102.025 1.60001 102.889 3.03999C103.785 4.44801 104.233 6.48001 104.233 9.13602C104.233 12.944 103.177 17.36 101.065 22.384C98.9526 27.408 96.0886 32.384 92.4726 37.312C92.6966 38.624 93.0646 39.568 93.5766 40.144C94.0886 40.688 94.7606 40.96 95.5926 40.96C96.9046 40.96 98.0566 40.592 99.0486 39.856C99.6149 39.4178 100.27 38.8076 101.013 38.0255C100.925 37.4183 100.881 36.7965 100.881 36.16C100.881 33.728 101.329 31.568 102.225 29.68C103.153 27.76 104.401 26.272 105.969 25.216C107.537 24.128 109.297 23.584 111.249 23.584C113.137 23.584 114.753 24.064 116.097 25.024C117.441 25.952 118.449 27.184 119.121 28.72C119.793 30.256 120.129 31.904 120.129 33.664C120.129 36.096 119.665 38.272 118.737 40.192C117.809 42.08 116.545 43.568 114.945 44.656C113.377 45.712 111.633 46.24 109.713 46.24C107.825 46.24 106.209 45.776 104.865 44.848C103.982 44.2022 103.245 43.4261 102.652 42.5197C101.826 43.3091 100.961 44.0052 100.057 44.608C98.4566 45.696 96.6326 46.24 94.5846 46.24C91.7686 46.24 89.6726 44.96 88.2966 42.4ZM80.0804 9.61601C81.0084 6.96001 81.8404 5.632 82.5764 5.632C83.4724 5.632 83.9204 6.84801 83.9204 9.28001C83.9204 12.384 83.2484 15.824 81.9044 19.6C80.5604 23.344 78.7524 27.088 76.4804 30.832C76.5444 27.216 76.9284 23.44 77.6324 19.504C78.3364 15.568 79.1524 12.272 80.0804 9.61601ZM47.752 35.296C48.168 35.296 48.488 35.488 48.712 35.872C48.968 36.256 49.096 36.784 49.096 37.456C49.096 38.704 48.792 39.696 48.184 40.432C45.016 44.304 41.64 46.24 38.056 46.24C34.952 46.24 32.472 45.04 30.616 42.64C28.76 40.24 27.832 36.8 27.832 32.32C27.832 31.232 27.88 30.144 27.976 29.056C25.864 29.44 23.56 29.728 21.064 29.92C19.4 30.048 18.264 30.128 17.656 30.16C17.016 33.424 16.12 37.424 14.968 42.16C14.296 44.944 13.016 46.336 11.128 46.336C9.07999 46.336 8.056 45.408 8.056 43.552C8.056 43.136 8.13599 42.56 8.29599 41.824C9.384 37.44 10.248 33.728 10.888 30.688L8.58398 30.784C7.52798 30.784 6.75998 30.608 6.28 30.256C5.79999 29.872 5.56 29.264 5.56 28.432C5.56 27.376 5.86398 26.608 6.47198 26.128C7.07999 25.616 8.08798 25.328 9.496 25.264L12.04 25.168C12.872 20.656 13.288 17.216 13.288 14.848C13.288 13.344 13.064 12.32 12.616 11.776C12.168 11.232 11.576 10.96 10.84 10.96C8.59998 10.96 6.07199 12.832 3.25598 16.576C2.84 17.12 2.37598 17.392 1.86398 17.392C1.41599 17.392 1.03198 17.184 0.712006 16.768C0.391998 16.352 0.231995 15.824 0.231995 15.184C0.231995 14.192 0.631989 13.136 1.43198 12.016C2.84 10.064 4.616 8.464 6.75998 7.216C8.90399 5.936 11.08 5.29601 13.288 5.29601C15.368 5.29601 16.968 6.01601 18.088 7.45601C19.24 8.864 19.816 11.072 19.816 14.08C19.816 16.736 19.432 20.336 18.664 24.88L23.368 24.64C25.384 24.544 27.112 24.384 28.552 24.16C29.128 20.64 30.008 17.344 31.192 14.272C32.376 11.2 33.848 8.70401 35.608 6.78401C37.368 4.86401 39.336 3.90401 41.512 3.90401C43.112 3.90401 44.376 4.54401 45.304 5.82401C46.232 7.07201 46.696 8.72002 46.696 10.768C46.696 18.704 42.648 24.208 34.552 27.28C34.456 28.56 34.408 29.888 34.408 31.264C34.408 34.624 34.824 37.008 35.656 38.416C36.488 39.824 37.656 40.528 39.16 40.528C40.472 40.528 41.672 40.192 42.76 39.52C43.848 38.816 45.08 37.632 46.456 35.968C46.84 35.52 47.272 35.296 47.752 35.296ZM41.272 8.08002C40.568 8.08002 39.816 8.72002 39.016 10C38.248 11.28 37.512 13.024 36.808 15.232C36.104 17.44 35.544 19.856 35.128 22.48C37.688 21.424 39.576 19.92 40.792 17.968C42.008 16.016 42.616 13.504 42.616 10.432C42.616 9.696 42.488 9.12 42.232 8.70401C41.976 8.28801 41.656 8.08002 41.272 8.08002ZM60.7566 28.336C59.5726 28.336 58.5646 29.024 57.7326 30.4C56.9326 31.776 56.5326 33.44 56.5326 35.392V35.488C58.4206 35.04 59.9086 34.368 60.9966 33.472C62.0846 32.576 62.6286 31.536 62.6286 30.352C62.6286 29.744 62.4526 29.264 62.1006 28.912C61.7806 28.528 61.3326 28.336 60.7566 28.336ZM98.2326 5.632C97.4966 5.632 96.6646 6.96001 95.7366 9.61601C94.8086 12.272 93.9926 15.568 93.2886 19.504C92.5846 23.44 92.2006 27.216 92.1366 30.832C94.4086 27.088 96.2166 23.344 97.5606 19.6C98.9046 15.824 99.5766 12.384 99.5766 9.28001C99.5766 6.84801 99.1286 5.632 98.2326 5.632ZM112.977 39.28C112.241 40.464 111.329 41.056 110.241 41.056C109.281 41.056 108.481 40.624 107.841 39.76C107.201 38.896 106.881 37.552 106.881 35.728C106.881 33.424 107.249 31.696 107.985 30.544C108.753 29.36 109.713 28.768 110.865 28.768C111.761 28.768 112.529 29.216 113.169 30.112C113.809 31.008 114.129 32.336 114.129 34.096C114.129 36.368 113.745 38.096 112.977 39.28Z"
              fill={"none"}
              stroke={"white"}
              overflow={"visible"}
              strokeWidth={1}
              strokeLinejoin={"round"}
              strokeLinecap={"round"}
              initial={{ pathLength: 0, fill: "rgba(255, 255, 255, 0)" }}
              animate={{ pathLength: 1, fill: "rgba(255, 255, 255, 1)" }}
              transition={{
                duration: 2,
                ease: "easeInOut",
                fill: { duration: 1, ease: [1, 0, 0.8, 1] },
              }}
            />
          </motion.svg>
        </AnimatePresence>
      </div>

      <button
        onClick={() => setPage("account")}
        className="btn-2 bg-blue-500 mt-3 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
      >
        {locales?.setupBtn}
      </button>
    </AppTemplate>
  );
};

const ColorPage: FC<IPageElement> = ({ setPage }) => {
  const { darkMode, setDarkMode, locales } = useCore();

  const changeColorMode = (toggle: boolean) => {
    post("setSetting", { key: "darkMode", value: toggle });
    setDarkMode(toggle);
  };

  return (
    <AppTemplate className="px-8 pt-10 pb-5 gap-3 flex flex-col items-center justify-center">
      <div className="flex h-full justify-center items-center flex-col gap-2">
        <FaPalette className="text-6xl" />
        <h1 className="text-2xl px-6 font-normal text-center">
          {locales?.deviceTheme}
        </h1>
      </div>

      <div className="grid grid-cols-2 w-full gap-3">
        <button
          onClick={() => changeColorMode(true)}
          className={`flex gap-2 text-xl flex-col items-center justify-center p-5 rounded-md ${
            darkMode
              ? "bg-blue-500 !bg-opacity-100"
              : "dark:bg-white bg-black !bg-opacity-5"
          }`}
        >
          <FaMoon />
          <p>{locales?.dark}</p>
        </button>
        <button
          onClick={() => changeColorMode(false)}
          className={`flex gap-2 text-xl flex-col items-center justify-center p-5 rounded-md ${
            !darkMode
              ? "bg-blue-500 !bg-opacity-100"
              : "dark:bg-white bg-black !bg-opacity-5"
          }`}
        >
          <FaSun />
          <p>{locales?.light}</p>
        </button>
      </div>

      <button
        onClick={() => setPage("animations")}
        className="btn-2 bg-blue-500 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
      >
        {locales.continueBtn}
      </button>
    </AppTemplate>
  );
};

const AnimationsPage: FC<IPageElement> = ({}) => {
  const { animations, setAnimations, locales } = useCore();
  const navigate = useNavigate();

  const changeAnimationMode = (toggle: boolean) => {
    post("setSetting", { key: "animations", value: toggle });
    setAnimations(toggle);
  };

  const finish = () => {
    navigate("/");
  };

  return (
    <AppTemplate className="px-8 pt-10 pb-5 gap-3 flex flex-col items-center justify-center">
      <div className="flex h-full justify-center items-center flex-col gap-2">
        <FaSpinner className="text-6xl" />
        <h1 className="text-2xl px-6 font-normal text-center">
          {locales?.animations}
        </h1>
      </div>

      <div className="grid grid-cols-2 w-full gap-3">
        <button
          onClick={() => changeAnimationMode(true)}
          className={`flex gap-2 text-xl flex-col items-center justify-center p-5 rounded-md ${
            animations
              ? "bg-blue-500 !bg-opacity-100"
              : "dark:bg-white bg-black !bg-opacity-5"
          }`}
        >
          <p>{locales?.on}</p>
        </button>
        <button
          onClick={() => changeAnimationMode(false)}
          className={`flex gap-2 text-xl flex-col items-center justify-center p-5 rounded-md ${
            !animations
              ? "bg-blue-500 !bg-opacity-100"
              : "dark:bg-white bg-black !bg-opacity-5"
          }`}
        >
          <p>{locales?.off}</p>
        </button>
      </div>

      <button
        onClick={finish}
        className="btn-2 bg-blue-500 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
      >
        {locales?.finishBtn}
      </button>
    </AppTemplate>
  );
};

export default Setup;
