import { AnyRecord } from "dns";
import { FC, useState } from "react";
import { FaRocket } from "react-icons/fa";
import { useTor } from ".";
import AppTemplate, { Splitter } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const Register: FC<IPageElement> = ({ setPage }) => {
  const { locales } = useCore();
  const { setAccount } = useTor();
  const [error, setError] = useState<any>(null);

  const createAccount = (e: any) => {
    e.preventDefault();

    const password = e.target.password.value;
    const password2 = e.target.password2.value;

    if (password !== password2) {
      setError(locales?.passwordNoMatch);
      return;
    }

    if (/\s/g.test(e.target.username.value)) {
      setError(locales?.noSpacesInName);
      return;
    }

    post("tor:createAccount", {
      username: e.target.username.value,
      password: e.target.password.value,
    }).then((status: any) => {
      if (typeof status === "string") {
        setError(status);
        return;
      }

      setAccount(status);
      setPage("main");
    });
  };

  return (
    <AppTemplate className="px-8 pt-10 pb-12 flex items-center flex-col justify-between">
      <div className="w-full h-full flex items-center flex-col justify-center">
        <div className="flex justify-center mb-3 items-center flex-col gap-2">
          <img
            src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Tor-logo-2011-flat.svg/1200px-Tor-logo-2011-flat.svg.png"
            width={"100px"}
          />
          <h1 className="text-2xl px-6 font-normal text-center mt-3">
            {locales?.register}
          </h1>
        </div>

        <form
          id="createAccount"
          onSubmit={createAccount}
          className="mb-2 w-full"
        >
          <div className="grid w-full gap-1">
            <label>{locales?.username}</label>
            <input
              className="input !ring-purple-400"
              name="username"
              maxLength={24}
              minLength={3}
              required
            />

            <Splitter />

            <label>{locales?.password}</label>
            <input
              className="input !ring-purple-400"
              name="password"
              type={"password"}
              maxLength={24}
              minLength={4}
              required
            />
            <label>{locales?.repeatPassword}</label>
            <input
              className="input !ring-purple-400"
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
          className="btn-2 bg-purple-500 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
        >
          {locales?.createAccount}
        </button>
        <button
          onClick={() => setPage("landing")}
          className="dark:text-gray-400 text-black font-medium"
        >
          {locales?.goBack}
        </button>
      </div>
    </AppTemplate>
  );
};

export default Register;
