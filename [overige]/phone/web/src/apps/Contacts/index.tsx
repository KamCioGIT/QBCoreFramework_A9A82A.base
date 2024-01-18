import { Tooltip } from "@mui/material";
import { FC, useEffect, useState } from "react";
import { FaComment, FaPhone, FaPlus, FaStar } from "react-icons/fa";
import { useLocation, useNavigate } from "react-router-dom";
import AppTemplate, { AppHeader, Splitter } from "../../components/AppTemplate";
import { IPageElement, Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import AddContactPage from "./Add";
import ContactPage from "./Contact";
import { v4 } from "uuid";
import { useCore } from "../../providers/CoreProvider";
import FlightModeActive from "../../components/FlightModeActive";

const Contacts = () => {
  const location: any = useLocation();
  const [page, setPage] = useState<any>({ page: "main" });
  const { flightMode } = useCore();

  const pages = [
    { name: "main", Element: MainPage },
    { name: "contact", Element: ContactPage },
    { name: "add", Element: AddContactPage },
  ];

  useEffect(() => {
    if (location.state?.adding || location.state?.contact) {
      if (location.state.adding) {
        setPage({ page: "add", args: { number: location.state.number } });
      } else {
        setPage({
          page: "contact",
          args: location.state.contact,
        });
      }
    }
  }, [location]);

  if (flightMode) return <FlightModeActive />;

  return (
    <AppTemplate>
      <Pages page={page} setPage={setPage} pages={pages} />
    </AppTemplate>
  );
};

const MainPage: FC<IPageElement> = ({ setPage }) => {
  const [contacts, setContacts] = useState([]);
  const [filtered, setFiltered]: any = useState<any>(null);
  const { locales } = useCore();

  const handleSearch = (e: any) => {
    const value = e.target.value.toLowerCase();
    var results = contacts.filter((data: any) =>
      data.name.toLowerCase().includes(value)
    );
    setFiltered(results);
  };

  useEffect(() => {
    setFiltered(null);
    post("getContacts").then((contacts: any) => {
      setContacts(contacts);
    });
  }, []);

  return (
    <AppTemplate className="pt-10 pb-10 flex flex-col px-5 absolute">
      <AppHeader>{locales?.contactsTitle}</AppHeader>
      <div className="flex gap-1">
        <input
          className="w-full rounded-sm !bg-opacity-5 bg-black dark:bg-white p-1 text-zinc-900 dark:text-white px-2 dark:placeholder:text-white placeholder:!text-opacity-30 focus:ring-2 focus:bg-opacity-10 hover:bg-opacity-10 transition-all ring-blue-400 outline-none font-medium"
          placeholder={locales?.searchContacts}
          onChange={handleSearch}
        />
        <button
          onClick={() => setPage("add")}
          className="btn !w-fit !rounded-sm"
        >
          <FaPlus />
        </button>
      </div>

      <Splitter />

      <div className="grid gap-1 overflow-auto">
        {contacts.length > 0 ? (
          filtered ? (
            filtered.length > 0 &&
            filtered.map((contact: IContact) => (
              <Contact
                key={v4()}
                number={contact.number}
                name={contact.name}
                favourite={false}
                onClick={() => setPage("contact", contact)}
              />
            ))
          ) : (
            contacts.map((contact: IContact) => (
              <Contact
                key={v4()}
                number={contact.number}
                name={contact.name}
                favourite={false}
                onClick={() => setPage("contact", contact)}
              />
            ))
          )
        ) : (
          <div className="text-center mt-2">{locales?.noContactsFound}</div>
        )}
      </div>
    </AppTemplate>
  );
};

interface IContact {
  name: string;
  number: string;
  onClick: any;
  favourite: boolean;
}

const Contact: FC<IContact> = ({ name, number, onClick, favourite }) => {
  const navigate = useNavigate();
  const { locales } = useCore();

  const call = (e: any) => {
    e.stopPropagation();
    post("call", { number });
  };

  const message = (e: any) => {
    e.stopPropagation();
    navigate("/messages", { state: { data: { number } } });
  };

  return (
    <div
      onClick={onClick}
      className="p-2 cursor-pointer flex justify-between items-center rounded-md hover:!bg-opacity-10 bg-black dark:bg-white !bg-opacity-5"
    >
      <div className="flex gap-2 items-center">
        {favourite && (
          <p className="text-yellow-500">
            <FaStar />
          </p>
        )}

        <h1>{name}</h1>
      </div>

      <div className="flex gap-2 items-center">
        <Tooltip title={locales?.call}>
          <button onClick={call} className="p-1 opacity-50 hover:opacity-100">
            <FaPhone />
          </button>
        </Tooltip>
        <Tooltip title={locales?.message}>
          <button
            onClick={message}
            className="p-1 opacity-50 hover:opacity-100"
          >
            <FaComment />
          </button>
        </Tooltip>
      </div>
    </div>
  );
};

export default Contacts;
