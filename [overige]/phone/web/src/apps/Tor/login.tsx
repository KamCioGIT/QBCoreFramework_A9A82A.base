import { FC, useState } from "react";
import { FaRocket } from "react-icons/fa";
import { useTor } from ".";
import AppTemplate from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { useCore } from "../../providers/CoreProvider";

const Login: FC<IPageElement> = ({ setPage }) => {
  const { login } = useTor();
  const { locales } = useCore();
  const [error, setError] = useState<any>(null);

  const handleLogin = async (e: any) => {
    e.preventDefault();
    const status = await login(
      e.target.username.value,
      e.target.password.value
    );
    if (!status) {
      setError(true);
    }
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
            {locales.login}
          </h1>
        </div>

        <form id="createAccount" onSubmit={handleLogin} className="mb-2 w-full">
          <div className="grid w-full gap-1">
            <label>{locales?.username}</label>
            <input
              className="input !ring-purple-400"
              name="username"
              required
            />

            <label>{locales?.password}</label>
            <input
              className="input !ring-purple-400"
              name="password"
              type={"password"}
              required
            />
          </div>
        </form>

        {error && (
          <div className="p-3 text-red-500">{locales?.loginIncorrect}</div>
        )}
      </div>

      <div className="grid w-full gap-3">
        <button
          type="submit"
          form="createAccount"
          className="btn-2 bg-purple-500 text-lg !rounded-xl flex items-center justify-center brightness-100 disabled:brightness-75 disabled:cursor-default"
        >
          {locales?.login}
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

export default Login;
