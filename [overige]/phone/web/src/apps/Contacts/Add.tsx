import { Tooltip } from "@mui/material";
import { FC, useRef, useState } from "react";
import { FaArrowLeft } from "react-icons/fa";
import { v4 } from "uuid";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const AddContactPage: FC<IPageElement> = ({ setPage, args }) => {
  const [profileModal, setProfileModal] = useState(false);
  const [profile, setProfile] = useState<string | null>(null);
  const profileInput = useRef<HTMLInputElement>(null);
  const { locales } = useCore();

  const handleProfileImage = () => {
    var url = profileInput?.current?.value;

    if (url) {
      setProfile(url);
      setProfileModal(false);
    }
  };

  const handleAdd = (e: any) => {
    e.preventDefault();
    var name = e.target.name.value;
    var number = e.target.number.value;
    post("addContact", { id: v4(), name, number, profile }).then(() =>
      setPage("main")
    );
  };

  return (
    <AppTemplate className="absolute pt-10 px-5">
      <AppHeader className="flex gap-2">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
      </AppHeader>
      <div className="flex flex-col gap-2 items-center w-full">
        <Tooltip
          title={locales?.setContactImage}
          enterDelay={300}
          leaveDelay={0}
        >
          <div
            className="hover:brightness-75 cursor-pointer"
            onClick={() => setProfileModal(true)}
          >
            <Avatar avatar={profile} />
          </div>
        </Tooltip>

        <form
          onSubmit={handleAdd}
          className="w-full text-center grid gap-1 mt-3"
        >
          <input className="input" name="name" placeholder="Name" required />
          <input
            className="input"
            name="number"
            placeholder={locales?.phoneNumber}
            type={"tel"}
            defaultValue={args && args?.number}
            required
          />
          <Splitter />
          <button className="btn">{locales?.add}</button>
        </form>
      </div>

      <Modal isOpen={profileModal} close={() => setProfileModal(false)}>
        <label>{locales?.contactImage}</label>
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
    </AppTemplate>
  );
};

export default AddContactPage;
