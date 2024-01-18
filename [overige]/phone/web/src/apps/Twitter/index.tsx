import { Tooltip } from "@mui/material";
import { differenceInDays, format } from "date-fns";
import {
  createContext,
  FC,
  useContext,
  useEffect,
  useRef,
  useState,
} from "react";
import {
  FaAt,
  FaCamera,
  FaComment,
  FaHeart,
  FaList,
  FaPaperPlane,
  FaRegComment,
  FaRegHeart,
  FaRegTrashAlt,
  FaTimes,
  FaTrashAlt,
  FaTwitter,
} from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import { v4 } from "uuid";
import AppTemplate, {
  AppHeader,
  Modal,
  Splitter,
} from "../../components/AppTemplate";
import Avatar from "../../components/Avatar";
import FlightModeActive from "../../components/FlightModeActive";
import { IPageElement, Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import LandingPage from "./Landing";
import LoginPage from "./Login";
import ProfilePage from "./Profile";
import RegisterPage from "./Register";

const TwitterContext = createContext<any>(null);

export const useTwitter = () => useContext(TwitterContext);

const Twitter = () => {
  const [page, setPage] = useState({ page: "main" });
  const [account, setAccount] = useState<any>(null);
  const { flightMode } = useCore();

  if (flightMode) return <FlightModeActive />;

  useEffect(() => {
    post("getTwitterAccount").then((account) => {
      if (account) {
        setAccount(account);
        setPage({ page: "main" });
      } else {
        setPage({ page: "landing" });
      }
    });
  }, []);

  const login = async (username: string, password: string) => {
    const { status }: any = await post("login", { username, password });
    if (status) {
      setAccount(status);
      setPage({ page: "main" });
      return true;
    } else {
      return false;
    }
  };

  const logout = async () => {
    post("logout");
    setPage({ page: "landing" });
    setTimeout(() => {
      setAccount(null);
    }, 500);
  };

  const pages = [
    { name: "landing", Element: LandingPage },
    { name: "login", Element: LoginPage },
    { name: "register", Element: RegisterPage },
    { name: "profile", Element: ProfilePage },
    { name: "main", Element: MainPage },
  ];

  return (
    <AppTemplate>
      <TwitterContext.Provider value={{ account, setAccount, login, logout }}>
        <Pages page={page} setPage={setPage} pages={pages} />
      </TwitterContext.Provider>
    </AppTemplate>
  );
};

const MainPage: FC<IPageElement> = ({ setPage }) => {
  const location: any = useLocation();
  const navigate = useNavigate();
  const [tweetModal, setTweetModal] = useState(
    location?.state?.images ? true : false
  );
  const [cameraModal, setCameraModal] = useState(false);
  const { account } = useTwitter();
  const [defaultTweet, setDefaultTweet] = useState("");
  const [images, setImages] = useState(
    location?.state?.images ? location?.state?.images : []
  );
  const { setBigView, locales } = useCore();

  const tweetInput: any = useRef();

  const reply = (user: string) => {
    setDefaultTweet(`@${user} `);
    setTweetModal(true);
  };

  const [page, setPageInner] = useState({ page: "main" });
  const pages = [
    { name: "main", Element: MainFeed, args: { setMainPage: setPage, reply } },
    { name: "dms", Element: DMFeed, args: { setMainPage: setPage, reply } },
  ];

  useEffect(() => {
    if (location?.state?.data) {
      setDefaultTweet(location?.state?.data?.tweet);
    }
  }, []);

  useEffect(() => {
    if (!tweetModal) {
      setDefaultTweet("");
      setImages([]);
      location!.state = null;
    }
  }, [tweetModal]);

  const tweet = (e: any) => {
    e.preventDefault();
    if (e.target.msg.value.length > 0 || images.length > 0) {
      post("tweet", { id: v4(), msg: e.target.msg.value, images });
      e.target.msg.value = "";
      setTweetModal(false);
    }
  };

  const takePic = () => {
    navigate("/camera", {
      state: {
        images,
        app: "twitter",
        data: { tweet: tweetInput.current.value },
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
      images.filter((_val: any, i: number) => i !== index)
    );
  };

  return (
    <AppTemplate className="flex  flex-col pt-10">
      <AppHeader className="flex !mb-1 justify-between px-5 items-center">
        <p className="flex items-center gap-2">
          <FaTwitter className="mt-1 text-blue-500" /> {locales?.twitterTitle}
        </p>
        <div className="cursor-pointer" onClick={() => setPage("profile")}>
          <Avatar
            className="flex-none w-10 h-10 !text-sm"
            name={account?.username}
            avatar={account?.avatar}
          />
        </div>
      </AppHeader>

      <Splitter className="mb-0" />

      <div className="relative h-full">
        <Pages page={page} pages={pages} setPage={setPageInner} />
      </div>
      <Footer page={page.page} setPage={setPageInner} />

      <Tooltip title={locales?.tweet} placement="top">
        <button
          onClick={() => setTweetModal(true)}
          className="absolute bottom-[17%] right-4 rounded-full w-14 h-14 flex items-center justify-center focus:ring transition-all bg-blue-500"
        >
          <FaPaperPlane />
        </button>
      </Tooltip>

      <Modal isOpen={tweetModal} close={() => setTweetModal(false)}>
        <p className="mb-2">{locales?.createTweet}</p>
        <form onSubmit={tweet}>
          <textarea
            className="input !resize-none"
            name="msg"
            rows={7}
            placeholder={locales?.enterTweet}
            defaultValue={defaultTweet}
            ref={tweetInput}
            minLength={2}
            maxLength={244}
          />

          {images.length > 0 && (
            <div className="grid grid-cols-3 gap-1 mt-2">
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

          <div className="flex gap-1 mt-3">
            <button
              type="button"
              onClick={() => setCameraModal(true)}
              className="btn !w-fit"
            >
              <FaCamera />
            </button>
            <button type="submit" className="btn-2 bg-blue-500">
              {locales?.tweet}
            </button>
          </div>
        </form>
      </Modal>

      <Modal isOpen={cameraModal} close={() => setCameraModal(false)}>
        <PicModal takePic={takePic} selectPic={selectPic} />
      </Modal>
    </AppTemplate>
  );
};

interface ITweet {
  id: string;
  msg: string;
  user: any;
  date: number;
  reply: (user: string) => void;
  likes: any;
  images: Array<string>;
}

const Tweet: FC<ITweet> = (tweet) => {
  const { account } = useTwitter();
  const [liked, setLiked] = useState(false);
  const [replyHover, setReplyHover] = useState(false);
  const [delHover, setDelHover] = useState(false);
  const { setBigView, locales } = useCore();

  useEffect(() => {
    setLiked(false);
    Object.keys(tweet.likes).map((like) => {
      if (tweet.likes[like].username == account?.username) {
        setLiked(true);
      }
    });
  }, [account, tweet]);

  const likeTweet = () => {
    post("likeTweet", { id: tweet.id });
  };

  const delTweet = () => {
    post("delTweet", { id: tweet.id });
  };

  return (
    <div className="w-full h-fit flex flex-col gap-2 p-2 bg-black dark:bg-white !bg-opacity-5 rounded-sm">
      <div className="flex gap-3">
        <Avatar
          className="flex-none w-10 h-10 !text-sm"
          name={tweet.user.name}
          avatar={tweet.user.avatar}
        />
        <div className="w-full">
          <div className="flex items-center mb-1 justify-between w-full">
            <div className="flex gap-1 items-center">
              <p>@{tweet.user.name}</p>
            </div>
            <p className="text-xs opacity-60 font-normal mr-1 capitalize">
              {format(
                new Date(tweet.date * 1000),
                differenceInDays(new Date(), new Date(tweet.date * 1000)) < 1
                  ? "HH:mm"
                  : "dd/LL/yyyy"
              )}
            </p>
          </div>
          <div>
            <p className="break-all font-normal grid gap-1">{tweet.msg}</p>
            {tweet.images.length > 0 && (
              <div
                className={`grid ${
                  tweet.images.length < 2 ? "grid-cols-1" : "grid-cols-2"
                }  gap-1 mt-2`}
              >
                {tweet.images.map((img: string) => (
                  <div
                    key={v4()}
                    onClick={() => setBigView(img)}
                    className={`w-full ${
                      tweet.images.length < 2 ? "h-[120px]" : "h-[50px]"
                    } relative rounded-md bg-cover bg-center`}
                    style={{ backgroundImage: `url(${img})` }}
                  />
                ))}
              </div>
            )}
          </div>
        </div>
      </div>

      <Splitter className="!m-1" />

      <div className="w-full p-1 flex">
        <Tooltip title={liked ? locales?.unlikeTweet : locales?.likeTweet}>
          <button
            onClick={likeTweet}
            className="w-full flex justify-center items-center"
          >
            <p className="flex items-center gap-2">
              {tweet.likes.length} {liked ? <FaHeart /> : <FaRegHeart />}
            </p>
          </button>
        </Tooltip>

        <Tooltip title={locales?.reply}>
          <button
            onMouseEnter={() => setReplyHover(true)}
            onMouseLeave={() => setReplyHover(false)}
            onClick={() => tweet.reply(tweet.user.name)}
            className="w-full flex justify-center items-center"
          >
            {replyHover ? <FaComment /> : <FaRegComment />}
          </button>
        </Tooltip>

        {account?.username === tweet.user.name && (
          <Tooltip title={locales?.delete}>
            <button
              onMouseEnter={() => setDelHover(true)}
              onMouseLeave={() => setDelHover(false)}
              onClick={delTweet}
              className="w-full flex justify-center items-center text-red-500"
            >
              {delHover ? <FaTrashAlt /> : <FaRegTrashAlt />}
            </button>
          </Tooltip>
        )}
      </div>
    </div>
  );
};

interface IPicModal {
  takePic: any;
  selectPic: any;
}

export const PicModal: FC<IPicModal> = ({ takePic, selectPic }) => {
  const [gallery, setGallery] = useState([]);

  useEffect(() => {
    post("getGallery").then((gallery: any) => setGallery(gallery));
  }, []);

  const handleCustomImg = (e: any) => {
    e.preventDefault();
    selectPic(e.target.img.value);
  };

  return (
    <div>
      <button className="btn mb-2" onClick={takePic}>
        Take Picture
      </button>

      <form onSubmit={handleCustomImg} className="flex gap-1">
        <input
          name="img"
          className="w-full rounded-sm !bg-opacity-5 bg-black dark:bg-white p-1 text-zinc-900 dark:text-white px-2 dark:placeholder:text-white placeholder:!text-opacity-30 focus:ring-2 focus:bg-opacity-10 hover:bg-opacity-10 transition-all ring-blue-400 outline-none font-medium"
          placeholder="Custom Image .(png|jpeg|gif)"
          type="url"
          required
        />
        <button className="btn !w-fit" type="submit">
          Use
        </button>
      </form>

      <Splitter />

      {gallery.length > 0 ? (
        <>
          <div
            className={`grid grid-cols-3 gap-1 mt-2 h-fit min-h-fit max-h-[200px] overflow-auto`}
          >
            {gallery.map((img: any) => (
              <div
                key={v4()}
                onClick={() => selectPic(img.img)}
                className={`w-full h-[50px] relative rounded-md bg-cover bg-center`}
                style={{ backgroundImage: `url(${img.img})` }}
              />
            ))}
          </div>
        </>
      ) : (
        <div className="text-center mt-2">No Photos Found</div>
      )}
    </div>
  );
};

const MainFeed: FC<IPageElement> = ({ args }) => {
  const { locales } = useCore();
  const [tweets, setTweets] = useState([]);

  useEffect(() => {
    post("getTweets").then((tweets: any) => setTweets(tweets));

    const listener = (e: any) => {
      if (e.data.type === "refreshTweets") {
        setTweets(e.data.tweets);
      }
    };

    window.addEventListener("message", listener);
    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  return (
    <div className="w-full h-full px-5 py-2 overflow-auto grid gap-1 content-start">
      {tweets.length > 0 ? (
        tweets.map((tweet: ITweet) => (
          <Tweet key={tweet.id} {...tweet} reply={args.reply} />
        ))
      ) : (
        <div className="text-center mt-2">{locales?.noTweetsFound}</div>
      )}
    </div>
  );
};

const DMFeed: FC<IPageElement> = ({ args }) => {
  const { locales } = useCore();
  const [tweets, setTweets] = useState([]);

  useEffect(() => {
    post("twitter:markRead");
    post("getMentions").then((tweets: any) => setTweets(tweets));

    const listener = (e: any) => {
      if (e.data.type === "refreshMentions") {
        setTweets(e.data.mentions);
      }
    };

    window.addEventListener("message", listener);
    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  return (
    <div className="w-full h-full px-5 py-2 overflow-auto grid gap-1 content-start">
      {tweets.length > 0 ? (
        tweets.map((tweet: ITweet) => (
          <Tweet key={tweet.id} {...tweet} reply={args.reply} />
        ))
      ) : (
        <div className="text-center mt-2">{locales?.noMentionsFound}</div>
      )}
    </div>
  );
};

interface IFooter {
  page: string;
  setPage: any;
}

const Footer: FC<IFooter> = ({ setPage, page }) => {
  const [mentions, setMentions] = useState(0);
  const { locales } = useCore();

  useEffect(() => {
    post("twitter:getUnread").then((calls: any) => {
      setMentions(calls);
    });

    const listener = (e: any) => {
      if (e.data.type === "refreshMentions") {
        setMentions(e.data.notifications);
      }
    };

    window.addEventListener("message", listener);
    return () => {
      window.removeEventListener("message", listener);
    };
  }, [page]);

  return (
    <div className="flex !bg-opacity-5 bg-black dark:bg-white h-[8rem] mt-2 pt-3 select-none border-black dark:border-white !border-opacity-10 border justify-between bottom-0 left-0 w-full">
      <div
        onClick={() => setPage({ page: "main" })}
        className={`flex flex-col gap-1 items-center w-full cursor-pointer hover:text-blue-500 !bg-opacity-5 ${
          page === "main" && "text-blue-500"
        }`}
      >
        <FaTwitter />
        <p>{locales?.tweets}</p>
      </div>
      <div
        onClick={() => setPage({ page: "dms" })}
        className={`flex flex-col gap-1 items-center w-full cursor-pointer hover:text-blue-500 !bg-opacity-5 ${
          page === "dms" && "text-blue-500"
        }`}
      >
        <div className="w-fit h-fit flex justify-center flex-col items-center relative">
          {mentions > 0 && (
            <div className="flex px-2 select-none items-center justify-center text-white text-xs rounded-full bg-red-500 absolute right-3 -top-1">
              {mentions}
            </div>
          )}

          <FaAt />
          <p>{locales?.mentions}</p>
        </div>
      </div>
    </div>
  );
};

export default Twitter;
