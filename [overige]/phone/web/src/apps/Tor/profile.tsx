import { Tooltip } from "@mui/material";
import { FC, useState } from "react";
import {
  FaArrowLeft,
  FaSignOutAlt,
  FaTrash,
  FaEllipsisH,
  FaKeyboard,
} from "react-icons/fa";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import Avatar from "../../components/Avatar";
import { MenuButton } from "../Settings";
import { useTor } from ".";

const Profile: FC<IPageElement> = ({ setPage }) => {
  const [image, setImage] = useState(false);
  const [usernameModal, setUsernameModal] = useState(false);
  const [error, setError] = useState<any>(null);
  const [changePass, setChangePass] = useState(false);
  const [delModal, setDelModal] = useState(false);
  const { locales } = useCore();
  const { account, setAccount, logout } = useTor();

  const editAvatar = (e: any) => {
    e.preventDefault();

    var url = e.target.avatar.value;

    if (url) {
      post("tor:changeAvatar", { avatar: url });
      setAccount({ ...account, avatar: url });
      setImage(false);
    }
  };

  const editUsername = async (e: any) => {
    e.preventDefault();

    var username = e.target.username.value;

    if (/\s/g.test(e.target.username.value)) {
      setError(locales?.noSpacesInName);
      return;
    }

    if (username) {
      const error = await post("tor:changeUsername", { username });

      if (error) {
        setError(error);
        return;
      }

      setAccount({ ...account, username });
      setUsernameModal(false);
    }
  };

  const editPassword = async (e: any) => {
    e.preventDefault();

    setError(null);

    const oldPass = e.target.oldPassword.value;
    const newPass = e.target.newPassword.value;
    const newPass2 = e.target.newPassword2.value;

    if (newPass !== newPass2) {
      setError(locales?.passwordNoMatch);
      return;
    }

    post("tor:changePassword", { oldPass, newPass }).then((error) => {
      if (error) {
        setError(error);
        return;
      }

      setChangePass(false);
    });
  };

  const deleteAccount = () => {
    post("tor:deleteAccount");
    setPage("landing");
    setTimeout(() => {
      setAccount(null);
    }, 500);
  };

  return (
    <AppTemplate className="pt-10 px-5 absolute">
      <AppHeader className="flex gap-2">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
      </AppHeader>

      <div className="flex flex-col gap-2 items-center w-full">
        <Tooltip
          title={locales?.changeProfileImage}
          enterDelay={300}
          leaveDelay={0}
        >
          <div
            onClick={() => setImage(true)}
            className="cursor-pointer hover:brightness-75"
          >
            <Avatar
              className="ring-purple-500 ring-opacity-80 mb-2 !ring-[3px]"
              name={account?.username}
              avatar={account?.avatar}
            />
          </div>
        </Tooltip>

        <p className="text-2xl font-normal">{account?.username}</p>
      </div>

      <Splitter className="mt-4" />

      <div className="grid gap-1">
        <MenuButton
          onClick={() => setUsernameModal(true)}
          icon={<FaKeyboard />}
          color={"bg-green-600"}
        >
          {locales?.changeUsername}
        </MenuButton>
        <MenuButton
          onClick={() => setChangePass(true)}
          icon={<FaEllipsisH />}
          color={"bg-blue-500"}
        >
          {locales?.changePassword}
        </MenuButton>
        <Splitter />
        <MenuButton
          onClick={logout}
          icon={<FaSignOutAlt />}
          color={"bg-blue-500"}
        >
          {locales?.logout}
        </MenuButton>
        <MenuButton
          onClick={() => setDelModal(true)}
          icon={<FaTrash />}
          color={"bg-red-500"}
        >
          {locales?.deleteAccount}
        </MenuButton>
      </div>

      <Modal isOpen={image} close={() => setImage(false)}>
        <form onSubmit={editAvatar}>
          <label>{locales?.imageUrl}</label>
          <input
            className="input"
            placeholder=".(png|jpeg|gif)"
            name="avatar"
            type="url"
            required
          />
          <div className="grid gap-1 mt-3">
            <button className="btn">{locales?.apply}</button>
          </div>
        </form>
      </Modal>

      <Modal isOpen={usernameModal} close={() => setUsernameModal(false)}>
        <form onSubmit={editUsername}>
          <label>{locales?.newUsername}</label>
          <input className="input" name="username" required />

          {error && <div className="p-2 text-red-500 text-center">{error}</div>}

          <div className="grid gap-1 mt-3">
            <button className="btn">{locales?.apply}</button>
          </div>
        </form>
      </Modal>

      <Modal isOpen={delModal} close={() => setDelModal(false)}>
        <p className="text-md text-center">{locales?.deleteAccountConf}</p>
        <div className="flex gap-2 mt-3">
          <button onClick={() => setDelModal(false)} className="btn">
            {locales?.cancel}
          </button>
          <button className="btn text-red-500" onClick={deleteAccount}>
            {locales?.delete}
          </button>
        </div>
      </Modal>

      <Modal isOpen={changePass} close={() => setChangePass(false)}>
        <form className="grid gap-1" onSubmit={editPassword}>
          <label>{locales?.currentPassword}</label>
          <input
            name="oldPassword"
            className="input"
            type={"password"}
            required
          />
          <Splitter />
          <label>{locales?.newPassword}</label>
          <input
            name="newPassword"
            className="input"
            type={"password"}
            required
          />
          <label>{locales?.repeatPassword}</label>
          <input
            name="newPassword2"
            className="input"
            type={"password"}
            required
          />

          <p className="text-red-500 mt-2 text-center">{error}</p>

          <button type="submit" className="btn-2 bg-purple-500 mt-3">
            {locales?.change}
          </button>
        </form>
      </Modal>
    </AppTemplate>
  );
};

export default Profile;
