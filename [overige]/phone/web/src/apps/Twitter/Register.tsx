import { FC, useState } from "react";
import { FaArrowLeft, FaTwitter } from "react-icons/fa";
import { useTwitter } from ".";
import AppTemplate, { AppHeader, Splitter } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const RegisterPage: FC<IPageElement> = ({ setPage }) => {
  const { setAccount } = useTwitter();
  const { locales } = useCore();
  const [error, setError] = useState<string | null>(null);

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

    post("create", {
      username: e.target.username.value,
      password: e.target.password.value,
      avatar: e.target.avatar.value,
    }).then(({ status }: any) => {
      if (typeof status === "string") {
        setError(status);
        return;
      }

      setAccount(status);
      setPage("main");
    });
  };

  return (
    <AppTemplate className="px-5 pt-10 absolute">
      <AppHeader className="flex gap-2 mb-3">
        <button onClick={() => setPage("landing")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p>{locales?.register}</p>
      </AppHeader>

      <Splitter />

      <form onSubmit={createAccount} className="grid gap-1">
        <input
          className="input"
          type={"text"}
          placeholder={locales?.username}
          name="username"
          maxLength={24}
          minLength={3}
          required
        />
        <input
          className="input"
          type={"password"}
          placeholder={locales?.password}
          name="password"
          maxLength={24}
          minLength={4}
          required
        />
        <input
          className="input"
          type={"password"}
          name="password2"
          maxLength={24}
          minLength={4}
          placeholder={locales?.repeatPassword}
          required
        />
        <Splitter />
        <input
          className="input"
          type={"url"}
          name="avatar"
          placeholder={locales?.profileImage}
        />

        <Splitter />

        <button className="btn">{locales?.register}</button>

        {error && <p className="text-red-500 mt-3 text-center">{error}</p>}
      </form>
    </AppTemplate>
  );
};

export default RegisterPage;
