import { Tooltip } from "@mui/material";
import { FC, MouseEvent, useEffect, useRef, useState } from "react";
import { FaArrowLeft, FaBell } from "react-icons/fa";
import { useTwitter } from ".";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import { MenuSwitch } from "../Settings";

const ProfilePage: FC<IPageElement> = ({ setPage }) => {
  const { account, logout, setAccount } = useTwitter();
  const [profileModal, setProfileModal] = useState(false);
  const [delModal, setDelModal] = useState(false);
  const [mentions, setMentions] = useState(false);
  const profileInput = useRef<HTMLInputElement>(null);
  const { locales } = useCore();

  const handleProfileImage = () => {
    var url = profileInput?.current?.value;

    if (url) {
      post("changeTwitterAvatar", { avatar: url });
      setAccount({ ...account, avatar: url });
      setProfileModal(false);
    }
  };

  const deleteAcc = async () => {
    post("delete");
    setPage("landing");
    setTimeout(() => {
      setAccount(null);
    }, 500);
  };

  useEffect(() => {
    post("getTwitterSettings").then((data: any) => {
      setMentions(data.toggle);
    });
  }, []);

  const toggleMention = (e: MouseEvent) => {
    const checkbox = e.target as HTMLInputElement;
    setMentions(checkbox.checked);
    post("setSetting", { key: "twitterMentions", value: checkbox.checked });
  };

  return (
    <AppTemplate className="px-5 pt-10">
      <AppHeader className="flex gap-2 mb-3">
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
            onClick={() => setProfileModal(true)}
            className="hover:brightness-75 cursor-pointer"
          >
            <Avatar name={account?.username} avatar={account?.avatar} />
          </div>
        </Tooltip>
        <p className="text-2xl font-normal">@{account?.username}</p>
      </div>

      <Splitter className="mt-4" />

      <MenuSwitch
        icon={<FaBell />}
        color="bg-blue-500"
        label={locales?.onlyMentions}
        checked={mentions}
        onChange={toggleMention}
      />

      <Splitter />

      <div className="grid gap-1">
        <button className="btn" onClick={logout}>
          {locales?.logout}
        </button>
        <button className="btn text-red-500" onClick={() => setDelModal(true)}>
          {locales?.deleteAccount}
        </button>
      </div>

      <Modal isOpen={profileModal} close={() => setProfileModal(false)}>
        <label>{locales?.profileImage}</label>
        <input
          className="w-full mt-1 rounded-sm !bg-opacity-5 bg-black dark:bg-white p-1 text-zinc-900 dark:text-white px-2 dark:placeholder:text-white placeholder:!text-opacity-30 focus:ring-2 focus:bg-opacity-10 hover:bg-opacity-10 transition-all ring-blue-400 outline-none font-medium"
          placeholder=".(png|jpeg|gif)"
          ref={profileInput}
        />
        <div className="grid gap-1 mt-3">
          <button className="btn" onClick={handleProfileImage}>
            {locales?.set}
          </button>
        </div>
      </Modal>

      <Modal isOpen={delModal} close={() => setDelModal(false)}>
        <p className="text-md text-center">{locales?.deleteAccountConf}</p>
        <div className="flex gap-2 mt-3">
          <button onClick={() => setDelModal(false)} className="btn">
            {locales?.cancel}
          </button>
          <button className="btn text-red-500" onClick={deleteAcc}>
            {locales?.delete}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

export default ProfilePage;
