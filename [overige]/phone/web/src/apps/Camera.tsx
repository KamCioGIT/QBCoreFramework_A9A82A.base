import { useEffect, useState } from "react";
import { MdFlipCameraIos } from "react-icons/md";
import { FaArrowLeft, FaImage, FaUndo } from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import { v4 } from "uuid";
import AppTemplate from "../components/AppTemplate";
import { post } from "../lib/post";
import { playSound } from "../lib/sound";

const Camera = () => {
  const location: any = useLocation();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [taking, setTaking] = useState(false);

  useEffect(() => {
    var active = false;

    post("openCamera").then(() => {
      // @ts-ignore
      let canvas = document.getElementById("local");
      // @ts-ignore
      window.mainRender.render(canvas);

      setLoading(false);
    });

    const listener = (e: any) => {
      if (e.which === 2) {
        active = !active;
        post("freeMove", { toggle: active });
      }
    };

    document.addEventListener("mouseup", listener);

    return () => {
      post("closeCamera").then(() => {
        // @ts-ignore
        window.mainRender.stop();
      });

      document.removeEventListener("mouseup", listener);
    };
  }, []);

  const takePic = async () => {
    setTaking(true);
    setLoading(true);
    playSound("./shutter.mp3");

    // @ts-ignore
    const link = await window.mainRender.takeScreenshot();

    if (location?.state?.images) {
      const images = location.state.images;
      images.push(link);
      navigate(`/${location.state.app}`, {
        state: { images, data: location.state.data },
      });
      return;
    }

    post("addImage", { img: link, id: v4() }).then(() => {
      setTaking(false);
      setLoading(false);
    });
  };

  const switchCam = () => {
    setLoading(true);

    // @ts-ignore
    window.mainRender.stop();
    post("switchCam").then(() => {
      // @ts-ignore
      let canvas = document.getElementById("local");
      // @ts-ignore
      window.mainRender.render(canvas);
      setLoading(false);
    });
  };

  const openGallery = () => {
    navigate("/gallery");
  };

  return (
    <AppTemplate className="relative flex pt-8">
      <canvas
        id="local"
        className="w-full h-full border-t-2 border-black dark:border-white border-opacity-70"
      />
      <footer className="absolute border-t-2 border-black dark:border-white border-opacity-70 bottom-0 flex items-center gap-8 justify-center w-full px-5 pb-12 pt-3 bg-gray-200 dark:bg-zinc-900">
        {location?.state?.images ? (
          <button
            onClick={() =>
              navigate(`/${location.state.app}`, {
                state: { images: location.state.images },
              })
            }
            disabled={loading}
            className="back-btn !w-12 !h-12"
          >
            <FaArrowLeft />
          </button>
        ) : (
          <button
            onClick={openGallery}
            disabled={loading}
            className="back-btn !w-12 !h-12"
          >
            <FaImage />
          </button>
        )}

        <button
          onClick={takePic}
          disabled={loading}
          className="back-btn !p-2 !w-16 !h-16"
        >
          {taking ? (
            <img src="./loader.svg" width={"100px"} height="100px" />
          ) : (
            <div className="rounded-full w-full h-full bg-zinc-900 dark:bg-white"></div>
          )}
        </button>
        <button
          onClick={switchCam}
          disabled={loading}
          className="back-btn !text-xl !w-12 !h-12"
        >
          <MdFlipCameraIos />
        </button>
      </footer>
    </AppTemplate>
  );
};

export default Camera;
