import { Skeleton, Tooltip } from "@mui/material";
import { motion } from "framer-motion";
import { FC, useEffect, useState } from "react";
import { FaCamera } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import AppTemplate, { AppHeader, Modal } from "../components/AppTemplate";
import { post } from "../lib/post";
import { useCore } from "../providers/CoreProvider";

const Gallery = () => {
  const [gallery, setGallery] = useState([]);
  const [options, setOptions] = useState(false);
  const [currentImage, setCurrentImage] = useState<any>(null);
  const navigate = useNavigate();
  const { changeBackground, locales } = useCore();

  useEffect(() => {
    post("getGallery").then((gallery: any) => {
      setGallery(gallery);
    });
  }, []);

  const setImageBackground = () => {
    changeBackground(currentImage.image);
    setOptions(false);
    setCurrentImage(null);
  };

  const deleteImage = () => {
    post("deleteImg", { id: currentImage.id }).then(() => {
      post("getGallery").then((gallery: any) => {
        setGallery(gallery);
      });
    });
    setOptions(false);
    setCurrentImage(null);
  };

  const copyURL = () => {
    const el = document.createElement("textarea");
    el.value = currentImage.image;
    document.body.appendChild(el);
    el.select();
    document.execCommand("copy");
    document.body.removeChild(el);
    setOptions(false);
    setCurrentImage(null);
  };

  const openOptions = (img: any) => {
    setCurrentImage(img);
    setOptions(true);
  };

  return (
    <AppTemplate className="px-5 pt-10 pb-10 flex flex-col">
      <AppHeader className="flex items-center justify-between">
        <p>{locales?.galleryTitle}</p>
        <Tooltip title={locales?.camera}>
          <button
            onClick={() => navigate("/camera")}
            className="back-btn focus:ring ring-blue-400"
          >
            <FaCamera />
          </button>
        </Tooltip>
      </AppHeader>

      <div className="grid grid-cols-2 overflow-auto gap-2">
        {gallery.length > 0 ? (
          gallery.map((img: any) => (
            <Image key={img.id} onContext={openOptions} {...img} />
          ))
        ) : (
          <div className="text-center col-span-full mt-2">
            {locales?.noPhotosFound}
          </div>
        )}
      </div>

      <Modal isOpen={options} close={() => setOptions(false)}>
        <div className="grid gap-1">
          <button className="btn" onClick={copyURL}>
            {locales?.copyUrl}
          </button>
          <button className="btn" onClick={setImageBackground}>
            {locales?.setAsBg}
          </button>
          <button className="btn" onClick={deleteImage}>
            {locales?.delete}
          </button>
        </div>
      </Modal>
    </AppTemplate>
  );
};

interface IImage {
  id: string;
  img: string;
  onContext: any;
}

const Image: FC<IImage> = ({ img: image, id, onContext }) => {
  const { setBigView } = useCore();
  const [loading, setLoading] = useState(true);

  const handleClick = () => {
    if (loading) return;
    setBigView(image);
  };

  const handleContext = (e: any) => {
    e.preventDefault();
    onContext({ image, id });
  };

  return (
    <>
      {loading ? (
        <>
          <img
            src={image}
            onLoad={() => setTimeout(() => setLoading(false), 300)}
            className="hidden"
          />
          <Skeleton
            variant="rectangular"
            height={"80px"}
            className="w-full rounded-md !bg-slate-400 !bg-opacity-75"
          />
        </>
      ) : (
        <div
          onClick={handleClick}
          onContextMenu={handleContext}
          className="relative flex items-center justify-center h-[80px]"
        >
          <motion.img
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            src={image}
            className={`rounded-lg brightness-100 cursor-pointer absolute left-0 top-0 w-full object-center object-cover h-full shadow-xl`}
          />
        </div>
      )}
    </>
  );
};

export default Gallery;
