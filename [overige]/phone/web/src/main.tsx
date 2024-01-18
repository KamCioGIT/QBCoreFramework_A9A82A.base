import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";
import { HashRouter } from "react-router-dom";
import NotificationProvider from "./providers/NotificationProvider";
import CoreProvider from "./providers/CoreProvider";

ReactDOM.render(
  <React.StrictMode>
    <HashRouter>
      <CoreProvider>
        <NotificationProvider>
          <App />
        </NotificationProvider>
      </CoreProvider>
    </HashRouter>
  </React.StrictMode>,
  document.getElementById("root")
);
