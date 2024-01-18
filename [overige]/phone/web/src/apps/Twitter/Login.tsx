import { FC, useState } from "react";
import { FaArrowLeft, FaTwitter } from "react-icons/fa";
import { useTwitter } from ".";
import AppTemplate, { AppHeader, Splitter } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { useCore } from "../../providers/CoreProvider";

const LoginPage: FC<IPageElement> = ({ setPage }) => {
  const { login } = useTwitter();
  const { locales } = useCore();
  const [error, setError] = useState(false);

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
    <AppTemplate className="px-5 pt-10 absolute">
      <AppHeader className="flex gap-2 mb-3">
        <button onClick={() => setPage("landing")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p>{locales?.login}</p>
      </AppHeader>

      <Splitter />

      <form onSubmit={handleLogin} className="grid gap-1">
        <input
          className="input"
          type={"text"}
          placeholder={locales?.username}
          name="username"
          required
        />
        <input
          className="input"
          type={"password"}
          placeholder={locales?.password}
          name="password"
          required
        />
        <Splitter />
        <button className="btn">{locales?.login}</button>

        {error && (
          <p className="text-red-500 mt-3 text-center">
            {locales?.loginIncorrect}
          </p>
        )}
      </form>
    </AppTemplate>
  );
};

export default LoginPage;
