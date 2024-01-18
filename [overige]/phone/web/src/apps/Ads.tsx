import React, { FC, useEffect, useRef, useState } from "react";
import { FaCamera, FaPhone, FaPhoneAlt, FaPlus, FaTimes } from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import { v4 } from "uuid";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../components/AppTemplate";
import { post } from "../lib/post";
import { useCore } from "../providers/CoreProvider";
import { MenuSwitch } from "./Settings";
import { PicModal } from "./Twitter";
import FlightModeActive from "../components/FlightModeActive";

const Ads = () => {
  const location: any = useLocation();
  const navigate = useNavigate();

  const [createModal, setCreateModal] = useState(
    location?.state?.images ? true : false
  );
  const [cameraModal, setCameraModal] = useState(false);
  const [delModal, setDelModal] = useState(false);
  const [selectedAd, setSelectedAd] = useState<any>(null);
  const [showName, setShowName] = useState<any>(false);
  const [showNumber, setShowNumber] = useState<any>(true);
  const [ads, setAds] = useState([]);
  const [filtered, setFiltered] = useState<any>(null);
  const [images, setImages] = useState(
    location?.state?.images ? location?.state?.images : []
  );
  const { setBigView, flightMode, locales } = useCore();

  const title: any = useRef(null);
  const content: any = useRef(null);

  useEffect(() => {
    if (location?.state?.data) {
      setShowName(location.state.data.name);
      setShowNumber(location.state.data.number);
    }

    setFiltered(null);
    post("getAds").then((nAds: any) => {
      setAds(nAds);
    });

    const listener = (evt: any) => {
      if (evt.data.type.includes("refreshAds")) {
        post("getAds").then((nAds: any) => {
          setAds(nAds);
        });
      }
    };

    window.addEventListener("message", listener);

    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  useEffect(() => {
    if (!createModal) {
      setImages([]);
      location!.state = null;
      setShowName(false);
    }
  }, [createModal]);

  const handleSearch = (e: any) => {
    const value = e.target.value.toLowerCase();
    var results = ads.filter(
      (data: any) =>
        data.message.toLowerCase().includes(value) |
        data.title.toLowerCase().includes(value)
    );
    setFiltered(results);
  };

  const handleSubmit = (e: any) => {
    e.preventDefault();
    post("addAd", {
      id: v4(),
      msg: e.target.msg.value,
      title: e.target.title.value,
      name: showName,
      number: showNumber,
      images,
    });
    setCreateModal(false);
  };

  const takePic = () => {
    navigate("/camera", {
      state: {
        images,
        app: "ads",
        data: {
          title: title.current.value,
          content: content.current.value,
          number: showNumber,
          name: showName,
        },
      },
    });
  };

  const selectPic = (img: string) => {
    setImages((images: any) => [...images, img]);
    setCameraModal(false);
  };

  const deleteImage = (e: any, index: number) => {
    e.stopPropagation();
    setImages((images: any) =>
      images.filter((val: any, i: number) => i !== index)
    );
  };

  const openDelModal = (id: any) => {
    setSelectedAd(id);
    setDelModal(true);
  };

  const delAd = () => {
    post("delAd", { id: selectedAd }).then(() => setDelModal(false));
  };

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate className="px-5 pt-10 pb-[8rem]">
      <AppHeader>{locales?.adTitle}</AppHeader>
      <div className="flex gap-1">
        <input
          className="w-full rounded-sm !bg-opacity-5 bg-black dark:bg-white p-1 text-zinc-900 dark:text-white px-2 dark:placeholder:text-white placeholder:!text-opacity-30 focus:ring-2 focus:bg-opacity-10 hover:bg-opacity-10 transition-all ring-blue-400 outline-none font-medium"
          placeholder={locales?.searchAds}
          onChange={handleSearch}
        />
        <button
          onClick={() => setCreateModal(true)}
          className="btn !w-fit !rounded-sm"
        >
          <FaPlus />
        </button>
      </div>

      <Splitter />

      <div className="grid gap-1 w-full h-full overflow-auto content-start">
        {ads.length > 0 ? (
          filtered ? (
            filtered.length > 0 &&
            filtered.map((ad: any) => (
              <Ad key={ad.id} {...ad} del={openDelModal} />
            ))
          ) : (
            ads.map((ad: any) => <Ad key={ad.id} {...ad} del={openDelModal} />)
          )
        ) : (
          <div className="text-center mt-2">{locales?.noAdsFound}</div>
        )}
      </div>

      <Modal isOpen={createModal} close={() => setCreateModal(false)}>
        <form onSubmit={handleSubmit} className="grid gap-1">
          <div>
            <label>{locales?.title}</label>
            <input
              name="title"
              ref={title}
              className="input"
              maxLength={30}
              defaultValue={
                location?.state?.data?.title ? location?.state?.data?.title : ""
              }
              required
            />
          </div>

          <div>
            <label>{locales?.description}</label>
            <textarea
              name="msg"
              className="input resize-none"
              rows={5}
              maxLength={244}
              minLength={3}
              defaultValue={
                location?.state?.data?.content
                  ? location?.state?.data?.content
                  : ""
              }
              ref={content}
              required
            />
          </div>

          <Splitter />

          <div className="grid gap-1">
            <MenuSwitch
              checked={showName}
              onChange={(e) => setShowName(e.target.checked)}
              label={locales?.includeName}
            />
            <MenuSwitch
              checked={showNumber}
              onChange={(e) => setShowNumber(e.target.checked)}
              label={locales?.includeNumber}
            />
          </div>

          <Splitter />

          {images.length > 0 && (
            <div className="grid grid-cols-3 gap-1 mb-2">
              {images.map((img: string, index: number) => (
                <div
                  key={v4()}
                  onClick={() => setBigView(img)}
                  className="w-full h-[50px] relative rounded-md bg-cover bg-center"
                  style={{ backgroundImage: `url(${img})` }}
                >
                  <button
                    onClick={(e) => deleteImage(e, index)}
                    className="w-[20px] h-[20px] flex items-center justify-center bg-black text-white bg-opacity-75 rounded-full absolute right-1 top-1 text-xs"
                  >
                    <FaTimes />
                  </button>
                </div>
              ))}
            </div>
          )}

          <div className="flex gap-1">
            <button
              type="button"
              onClick={() => setCameraModal(true)}
              className="btn !w-fit"
            >
              <FaCamera />
            </button>
            <button type="submit" className="btn">
              {locales?.create}
            </button>
          </div>
        </form>
      </Modal>

      <Modal isOpen={cameraModal} close={() => setCameraModal(false)}>
        <PicModal takePic={takePic} selectPic={selectPic} />
      </Modal>

      <Modal isOpen={delModal} close={() => setDelModal(false)}>
        <h1 className="text-lg mb-1">{locales?.deleteAd}</h1>
        <div className="flex gap-1 mt-3">
          <button className="btn" onClick={() => setDelModal(false)}>
            {locales?.cancel}
          </button>
          <button onClick={delAd} className="btn-2 bg-red-500">
            {locales.delete}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface IAd {
  id: string;
  message: string;
  title: string;
  number: string;
  name: string;
  del: any;
  canDelete?: boolean;
  images: Array<string>;
}

const Ad: FC<IAd> = ({
  id,
  message,
  title,
  name,
  number,
  images,
  del,
  canDelete,
}) => {
  const { setBigView } = useCore();

  return (
    <div
      onContextMenu={() => canDelete && del(id)}
      className="p-2 text-center  text-sm bg-yellow-500 !text-zinc-900 rounded-sm"
    >
      <p className="mb-1 break-words font-bold">{title}</p>
      <p className="break-words">{message}</p>
      {images.length > 0 && (
        <div
          className={`grid ${
            images.length < 2 ? "grid-cols-1" : "grid-cols-2"
          }  gap-1 mt-2`}
        >
          {images.map((img: string) => (
            <div
              key={v4()}
              onClick={() => setBigView(img)}
              className={`w-full ${
                images.length < 2 ? "h-[120px]" : "h-[50px]"
              } relative rounded-md bg-cover bg-center`}
              style={{ backgroundImage: `url(${img})` }}
            />
          ))}
        </div>
      )}
      <div className="flex w-full text-xs text-center mt-2">
        {name && <p className="w-full border-r border-zinc-900">{name}</p>}
        {number && <p className="w-full">{number}</p>}
      </div>
    </div>
  );
};

export default Ads;
