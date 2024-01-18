import { FC } from "react";
import { FaTwitter } from "react-icons/fa";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { useCore } from "../../providers/CoreProvider";

const LandingPage: FC<IPageElement> = ({ setPage }) => {
  const { locales } = useCore();

  return (
    <AppTemplate className="px-5 pb-[5rem] absolute flex flex-col justify-center">
      <div className="z-50">
        <AppHeader className="flex flex-col items-center gap-2 text-center">
          <p className="text-blue-500 text-3xl mb-3">
            <FaTwitter />
          </p>
          <p>{locales?.welcomeTwitter}</p>
        </AppHeader>
        <p className="text-center mb-5 dark:text-slate-400 text-slate-600">
          {locales?.twitterInfo}
        </p>

        <div className="grid px-3 gap-1">
          <button
            className="btn-2 bg-blue-500 !text-white"
            onClick={() => setPage("login")}
          >
            {locales?.login}
          </button>
          <button className="btn" onClick={() => setPage("register")}>
            {locales?.register}
          </button>
        </div>
      </div>
    </AppTemplate>
  );
};

export default LandingPage;
