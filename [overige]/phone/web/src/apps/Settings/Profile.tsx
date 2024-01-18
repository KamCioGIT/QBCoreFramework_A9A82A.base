import { Tooltip, ClickAwayListener } from "@mui/material";
import { FC, useEffect, useState } from "react";
import {
  FaArrowLeft,
  FaCopy,
  FaEllipsisH,
  FaEllipsisV,
  FaFile,
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
import { MenuButton } from ".";

const Profile: FC<IPageElement> = ({ setPage }) => {
  const [image, setImage] = useState(false);
  const [copyTooltip, setCopyTooltip] = useState(false);
  const [profile, setProfile] = useState<any>(null);
  const [changePass, setChangePass] = useState<any>(null);
  const [error, setError] = useState<any>(null);
  const { locales } = useCore();

  useEffect(() => {
    post("getProfile").then((profile: any) => {
      setProfile(profile);
    });
  }, []);

  const copyNumber = () => {
    const el = document.createElement("textarea");
    el.value = profile?.number;
    document.body.appendChild(el);
    el.select();
    document.execCommand("copy");
    document.body.removeChild(el);

    setCopyTooltip(true);

    setTimeout(() => {
      setCopyTooltip(false);
    }, 1000);
  };

  const editAvatar = (e: any) => {
    e.preventDefault();
    setImage(false);
    post("setAvatar", { avatar: e.target.avatar.value }).then(
      (profile: any) => {
        setProfile(profile);
      }
    );
  };

  const handleChangePassword = (e: any) => {
    e.preventDefault();

    setError(null);

    const oldPass = e.target.oldPassword.value;
    const newPass = e.target.newPassword.value;
    const newPass2 = e.target.newPassword2.value;

    if (newPass !== newPass2) {
      setError(locales?.passwordNoMatch);
      return;
    }

    post("settings:changePassword", { oldPass, newPass }).then((error) => {
      if (error) {
        setError(error);
        return;
      }

      post("getProfile").then((profile: any) => {
        setProfile(profile);
        setChangePass(false);
      });
    });
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
            <Avatar name={profile?.name} avatar={profile?.avatar} />
          </div>
        </Tooltip>

        <p className="text-2xl font-normal">{profile?.name}</p>

        <Splitter className="w-full my-1" />

        <div className="flex justify-between w-full py-1 px-3">
          <p>{locales?.number}</p>
          <div className="flex gap-2 font-normal opacity-80">
            <p>{profile?.number}</p>
            <ClickAwayListener onClickAway={() => setCopyTooltip(false)}>
              <Tooltip
                disableHoverListener
                title={locales?.copyClipboard}
                open={copyTooltip}
                enterDelay={0}
                leaveDelay={0}
              >
                <button onClick={copyNumber}>
                  <FaCopy className="text-[16px]" />
                </button>
              </Tooltip>
            </ClickAwayListener>
          </div>
        </div>

        <div className="flex justify-between w-full py-1 px-3">
          <p>{locales?.email}</p>
          <p className="font-normal opacity-80">{profile?.email}</p>
        </div>
      </div>

      <Splitter />

      <MenuButton
        onClick={() => {
          setChangePass(true);
          setError(null);
        }}
        color="bg-blue-500"
        icon={<FaEllipsisH />}
      >
        {locales?.changePassword}
      </MenuButton>

      <Modal isOpen={changePass} close={() => setChangePass(false)}>
        <form className="grid gap-1" onSubmit={handleChangePassword}>
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

          <button type="submit" className="btn-2 bg-blue-500 mt-3">
            {locales?.change}
          </button>
        </form>
      </Modal>

      <Modal isOpen={image} close={() => setImage(false)}>
        <form onSubmit={editAvatar}>
          <label>{locales?.imageUrl}</label>
          <input
            className="input"
            placeholder=".(png|jpeg|gif)"
            name="avatar"
            type="url"
          />
          <div className="grid gap-1 mt-3">
            <button className="btn">{locales?.apply}</button>
          </div>
        </form>
      </Modal>
    </AppTemplate>
  );
};

export default Profile;
