import { FC, useEffect, useRef, useState } from "react";
import { FaArrowLeft } from "react-icons/fa";
import { v4 } from "uuid";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const Note: FC<IPageElement> = ({ setPage, args }) => {
  const [content, setContent] = useState(
    args?.note?.content ? args?.note?.content : ""
  );
  const { locales } = useCore();

  useEffect(() => {
    if (content.length > 0) {
      if (args.new) {
        const id = v4();
        args.new = false;
        args.note = { id, content };
        post("createNote", { id, content });
      } else {
        post("updateNote", {
          id: args?.note?.id,
          content: content,
        });
      }
    } else {
      post("deleteNote", { id: args?.note?.id });
    }
  }, [content, args]);

  return (
    <AppTemplate className="px-5 py-10 flex flex-col">
      <AppHeader className="flex gap-2">
        <button onClick={() => setPage("main")} className="back-btn">
          <FaArrowLeft />
        </button>
        <p>{locales?.note}</p>
      </AppHeader>
      <textarea
        defaultValue={content}
        className="input h-full resize-none"
        placeholder={locales?.enterNote}
        onChange={(e: any) => setContent(e.target.value)}
      />
    </AppTemplate>
  );
};

export default Note;
