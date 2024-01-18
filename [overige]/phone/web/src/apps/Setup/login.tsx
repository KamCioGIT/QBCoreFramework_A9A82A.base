import { AnimatePresence, motion } from "framer-motion";
import { FC, useState } from "react";
import { FaRocket } from "react-icons/fa";
import AppTemplate, { Splitter } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const LoginPage: FC<IPageElement> = ({ setPage }) => {
  const { locales } = useCore();
  const [error, setError] = useState<string | null>(null);

  const login = (e: any) => {
    e.preventDefault();

    post("setup:login", {
      email: e.target.email.value + "@" + locales?.emailProvider,
      password: e.target.password.value,
    }).then((data: any) => {
      if (!data.status) {
        setError(locales?.loginIncorrect);
        return;
      }

      setPage("colormode");
    });
  };

  return (
    <AppTemplate className="px-8 pt-10 pb-5 flex items-center flex-col justify-between">
      <div className="w-full h-full flex items-center flex-col justify-center">
        <div className="flex justify-center mb-3 items-center flex-col gap-2">
          <FaRocket className="text-5xl mb-2" />
          <h1 className="text-2xl px-6 font-normal text-center">
            {locales?.login}
          </h1>
        </div>

        <form id="createAccount" onSubmit={login} className="mb-2 w-full">
          <div className="grid w-full gap-1">
            <label>{locales?.email}</label>
            <div className="flex gap-2 items-center justify-center">
              <input className="input" name="email" required />
              <div className="input max-w-[50%] text-sm h-full flex items-center !w-fit">
                <p className="text-ellipsis overflow-hidden">
                  @{locales?.emailProvider}
                </p>
              </div>
            </div>

            <label>{locales?.password}</label>
            <input
              className="input"
              name="password"
              type={"password"}
              required
            />
          </div>
        </form>

        <div className="p-3 text-red-500">{error}</div>
      </div>

      <div className="grid w-full gap-3">
        <button
          type="submit"
          form="createAccount"
          className="btn-2 bg-blue-500 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
        >
          {locales?.login}
        </button>
        <button
          onClick={() => setPage("account")}
          className="dark:text-gray-400 text-black font-medium"
        >
          {locales?.goBack}
        </button>
      </div>
    </AppTemplate>
  );
};

export default LoginPage;
