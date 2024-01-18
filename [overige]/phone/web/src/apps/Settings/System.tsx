import { FC, useState } from "react";
import { FaArrowLeft, FaCloud, FaEraser } from "react-icons/fa";
import { MenuButton } from ".";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const System: FC<IPageElement> = ({ setPage }) => {
  // modals
  const [resetModal, setResetModal] = useState(false);
  const { syncing, setSyncing, locales } = useCore();

  const resetPhone = () => {
    post("resetPhone");
  };

  const syncPhone = () => {
    if (syncing) return;

    setSyncing(true);
    post("syncPhone");
  };

  return (
    <AppTemplate className="pt-10 px-5 absolute">
      <AppHeader className="flex gap-2">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p>{locales?.system}</p>
      </AppHeader>

      <div>
        <div className="flex justify-between">
          <p>{locales?.versionHeader}</p>
          <p>{locales?.version}</p>
        </div>
        <Splitter />
        <div className="flex justify-between">
          <p>{locales?.osHeader}</p>
          <p>{locales?.operatingSystem}</p>
        </div>
        <Splitter />
        <div className="grid gap-1">
          <MenuButton
            onClick={syncPhone}
            icon={<FaCloud />}
            color="bg-blue-500"
          >
            {locales?.syncPhone}
          </MenuButton>
          <MenuButton
            onClick={() => setResetModal(true)}
            icon={<FaEraser />}
            color="bg-red-500"
          >
            {locales?.factoryReset}
          </MenuButton>
        </div>
      </div>

      <Modal isOpen={resetModal} close={() => setResetModal(false)}>
        <p>{locales?.resetConfirmation}</p>
        <div className="flex gap-2 mt-3">
          <button onClick={() => setResetModal(false)} className="btn">
            {locales?.no}
          </button>
          <button className="btn text-red-500" onClick={resetPhone}>
            {locales?.yes}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

export default System;
