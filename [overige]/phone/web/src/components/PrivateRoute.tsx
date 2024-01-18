import { FC } from "react";
import { Navigate } from "react-router-dom";
import { useCore } from "../providers/CoreProvider";

interface IPrivateRoute {
  element: any;
}

const PrivateRoute: FC<IPrivateRoute> = ({ element }) => {
  const { locked } = useCore();

  if (locked) {
    return <Navigate to={"/lock"} />;
  }

  return element;
};

export default PrivateRoute;
