import { AnimatePresence, motion } from "framer-motion";
import { FC, useState } from "react";
import { FaRocket } from "react-icons/fa";
import AppTemplate, { Splitter } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const CreatePage: FC<IPageElement> = ({ setPage }) => {
  const [error, setError] = useState<string | null>(null);
  const { locales } = useCore();

  const createAccount = (e: any) => {
    e.preventDefault();

    const password = e.target.password.value;
    const password2 = e.target.password2.value;

    if (password !== password2) {
      setError(locales?.passwordNoMatch);
      return;
    }

    if (/\s/g.test(e.target.email.value)) {
      setError(locales?.noSpacesInEmail);
      return;
    }

    post("setup:createAccount", {
      name: e.target.name.value,
      email: e.target.email.value + "@" + locales?.emailProvider,
      password: e.target.password.value,
    }).then((data: any) => {
      if (data.status) {
        setError(data.status);
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
            {locales?.createAccount}
          </h1>
        </div>

        <form
          id="createAccount"
          onSubmit={createAccount}
          className="mb-2 w-full"
        >
          <div className="grid w-full gap-1">
            <label>{locales?.name}</label>
            <input className="input" name="name" required />

            <label>{locales?.email}</label>
            <div className="flex gap-2 items-center justify-center">
              <input
                className="input"
                name="email"
                maxLength={24}
                minLength={3}
                required
              />
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
              maxLength={24}
              minLength={4}
              required
            />
            <label>{locales?.repeatPassword}</label>
            <input
              className="input"
              name="password2"
              type={"password"}
              maxLength={24}
              minLength={4}
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
          {locales?.create}
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

export default CreatePage;
