import React from "react";
import { FaPlane } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import AppTemplate from "./AppTemplate";

const FlightModeActive = () => {
  const navigate = useNavigate();

  const disableFlightMode = () => {
    navigate("/settings");
  };

  return (
    <AppTemplate className="px-10 py-10 flex gap-3 flex-col items-center justify-center">
      <FaPlane className="text-4xl" />
      <p className="text-center text-gray-300">
        This app is disabled whilst <b>Flight Mode</b> is active.
      </p>
      <button onClick={disableFlightMode} className="btn-2 bg-orange-400">
        Disable Flight Mode
      </button>
    </AppTemplate>
  );
};

export default FlightModeActive;
