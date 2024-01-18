import { Tooltip } from "@mui/material";
import { FC, useRef, useState } from "react";
import { FaArrowLeft, FaComment, FaPhone } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const ContactPage: FC<IPageElement> = ({ setPage, args }) => {
  const [profileModal, setProfileModal] = useState(false);
  const [deleteModal, setDeleteModal] = useState(false);
  const [editMode, setEditMode] = useState(false);
  const [profile, setProfile] = useState<string | null>(args.profile);
  const name = useRef<HTMLInputElement>(null);
  const number = useRef<HTMLInputElement>(null);
  const profileInput = useRef<HTMLInputElement>(null);
  const navigate = useNavigate();
  const { locales } = useCore();

  const handleProfileImage = () => {
    var url = profileInput?.current?.value;

    if (url) {
      setProfile(url);
      setProfileModal(false);
    }
  };

  const handleEditToggle = () => {
    var oldEdit = editMode;

    setEditMode((cur) => !cur);

    setTimeout(() => {
      if (!oldEdit) {
        name.current?.focus();
      } else {
        post("editContact", {
          id: args.id,
          name: name.current?.value,
          number: number.current?.value,
          profile,
        }).then(() => {
          args.name = name.current?.value;
          (args.number = number.current?.value), (args.profile = profile);
        });
      }
    });
  };

  const handleDelete = () => {
    post("removeContact", { id: args.id }).then(() => {
      setDeleteModal(false);
      setPage("main");
    });
  };

  const resetEdit = () => {
    name.current!.value = args.name;
    number.current!.value = args.number;
    setProfile(args.profile);
    setEditMode(false);
  };

  const call = () => {
    post("call", { number: args.number });
  };

  const msg = () => {
    navigate("/messages", { state: { data: { number: args.number } } });
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
          title={!editMode ? "" : locales?.changeContactImage}
          enterDelay={300}
          leaveDelay={0}
        >
          <div
            onClick={() => editMode && setProfileModal(true)}
            className={`${editMode && "hover:brightness-75 cursor-pointer"}`}
          >
            <Avatar
              name={name.current?.value ? name.current.value : args.name}
              avatar={profile}
            />
          </div>
        </Tooltip>

        <input
          defaultValue={args.name}
          spellCheck={false}
          disabled={!editMode}
          ref={name}
          readOnly={!editMode}
          placeholder={locales?.name}
          className={`bg-opacity-0 ${
            editMode && "!bg-opacity-5 outline-none"
          } bg-white rounded-sm p-1 text-zinc-900 dark:text-white focus:ring mt-1 whitespace-nowrap overflow-hidden text-ellipsis ring-blue-400 text-center text-2xl`}
        />

        {!editMode && (
          <div className="flex gap-2 mt-1">
            <Tooltip title={locales?.call}>
              <button onClick={call} className="back-btn">
                <FaPhone />
              </button>
            </Tooltip>

            <Tooltip title={locales?.message}>
              <button onClick={msg} className="back-btn">
                <FaComment />
              </button>
            </Tooltip>

            {/* <Tooltip title="Favourite">
              <button className="back-btn">
                <FaStar />
              </button>
            </Tooltip> */}
          </div>
        )}

        <div className="w-full text-center grid gap-1">
          {!args.default && (
            <>
              <Splitter />

              <input
                className={`input text-center ${
                  !editMode && "!bg-transparent"
                }`}
                defaultValue={args.number && args.number}
                placeholder={locales?.phoneNumber}
                disabled={!editMode}
                readOnly={!editMode}
                ref={number}
              />
              <Splitter />

              <button className="btn" onClick={handleEditToggle}>
                {!editMode ? locales?.edit : locales?.save}
              </button>
              {editMode && (
                <button className="btn" onClick={resetEdit}>
                  Cancel
                </button>
              )}
              {!editMode && (
                <button
                  className="btn text-red-500"
                  onClick={() => setDeleteModal(true)}
                >
                  {locales?.delete}
                </button>
              )}
            </>
          )}
        </div>
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
            Set
          </button>
        </div>
      </Modal>

      <Modal isOpen={deleteModal} close={() => setDeleteModal(false)}>
        <p>{locales?.deleteContact}</p>
        <div className="flex gap-2 mt-3">
          <button onClick={() => setDeleteModal(false)} className="btn">
            {locales?.no}
          </button>
          <button className="btn text-red-500" onClick={handleDelete}>
            {locales?.delete}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

export default ContactPage;
