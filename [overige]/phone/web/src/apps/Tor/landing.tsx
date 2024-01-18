import { FC } from "react";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { useCore } from "../../providers/CoreProvider";

const Landing: FC<IPageElement> = ({ setPage }) => {
  const { locales } = useCore();

  return (
    <AppTemplate className="px-5 pb-[5rem] absolute flex flex-col justify-center">
      <div className="z-50">
        <AppHeader className="flex flex-col items-center gap-2 text-center">
          <img
            src="https://cdn0.iconfinder.com/data/icons/flat-round-system/512/tor-512.png"
            width={"70px"}
          />
          <p>{locales?.torTitle}</p>
        </AppHeader>
        <p className="text-center mb-5 px-5 dark:text-slate-400 text-slate-600">
          {locales?.torSubheader}
        </p>

        <div className="grid px-3 gap-1">
          <button
            className="btn-2 bg-purple-500 !text-white"
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

export default Landing;
