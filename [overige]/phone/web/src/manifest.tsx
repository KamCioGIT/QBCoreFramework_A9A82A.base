import { ReactElement } from "react";
import Ads from "./apps/Ads";
import AppStore from "./apps/AppStore";
import Banking from "./apps/Banking";
import Calculator from "./apps/Calculator";
import Camera from "./apps/Camera";
import Contacts from "./apps/Contacts";
import Dispatch from "./apps/Dispatch";
import Gallery from "./apps/Gallery";
import Mail from "./apps/Mail";
import Messages from "./apps/Messages";
import Notes from "./apps/Notes";
import Phone from "./apps/Phone";
import Ping from "./apps/Ping";
import Settings from "./apps/Settings";
import Tor from "./apps/Tor";
import Twitter from "./apps/Twitter";

export const elements: { [key: string]: ReactElement } = {
  ["phone"]: <Phone />,
  ["messages"]: <Messages />,
  ["contacts"]: <Contacts />,
  ["mail"]: <Mail />,
  ["camera"]: <Camera />,
  ["gallery"]: <Gallery />,
  ["banking"]: <Banking />,
  ["ads"]: <Ads />,
  ["twitter"]: <Twitter />,
  ["notes"]: <Notes />,
  ["dispatch"]: <Dispatch />,
  ["tor"]: <Tor />,
  ["ping"]: <Ping />,
  ["calculator"]: <Calculator />,
  ["appstore"]: <AppStore />,
  ["settings"]: <Settings />,
};
