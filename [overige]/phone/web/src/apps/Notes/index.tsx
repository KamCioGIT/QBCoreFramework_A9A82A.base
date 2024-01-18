import React, { FC, useEffect, useState } from "react";
import { FaPlus } from "react-icons/fa";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import { IPageElement, Pages } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";
import Note from "./Note";

const Notes = () => {
  const [page, setPage] = useState({ page: "main" });

  const pages = [
    { name: "main", Element: HomePage },
    { name: "note", Element: Note },
  ];

  return (
    <AppTemplate>
      <Pages page={page} pages={pages} setPage={setPage} />
    </AppTemplate>
  );
};

const HomePage: FC<IPageElement> = ({ setPage }) => {
  const [notes, setNotes] = useState([]);
  const { locales } = useCore();

  useEffect(() => {
    post("getNotes").then((data: any) => {
      setNotes(data);
    });
  }, []);

  const openNote = (note: INote) => {
    setPage("note", { note });
  };

  const createNote = () => {
    setPage("note", { new: true });
  };

  return (
    <AppTemplate className="px-5 pt-10 pb-10 flex  flex-col">
      <AppHeader className="flex justify-between">
        <h1>{locales?.notesTitle}</h1>
        <button onClick={createNote} className="back-btn">
          <FaPlus />
        </button>
      </AppHeader>

      <div className="h-full relative overflow-auto">
        <div className="grid content-start w-full h-full gap-1">
          {notes.length > 0 ? (
            notes.map((note: INote) => (
              <TNote
                key={note.id}
                id={note.id}
                content={note.content}
                openNote={openNote}
              />
            ))
          ) : (
            <div className="text-center mt-2">{locales?.noNotesFound}</div>
          )}
        </div>
      </div>
    </AppTemplate>
  );
};

interface INote {
  id: string;
  content: string;
  openNote: any;
}

const TNote: FC<INote> = ({ id, content, openNote }) => {
  return (
    <div
      className="dark:bg-white h-fit overflow-hidden !bg-opacity-5 relative w-full bg-black p-2 rounded-md hover:!bg-opacity-10 cursor-pointer"
      onClick={() => openNote({ id, content })}
    >
      <p className="w-full text-ellipsis overflow-hidden whitespace-nowrap">
        {content}
      </p>
    </div>
  );
};

export default Notes;
