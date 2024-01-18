import { FC, useEffect, useState } from "react";
import { Email, IEmail } from ".";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

export const ReceivedMail: FC<IPageElement> = ({ args }) => {
  const [mail, setMail] = useState([]);
  const { locales } = useCore();

  useEffect(() => {
    post("getMailRec").then((mail: any) => {
      setMail(mail);
    });

    const listener = (evt: any) => {
      if (evt.data.type === `mail:refresh`) {
        setMail(evt.data.mail);
      }
    };

    window.addEventListener("message", listener);

    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  return (
    <AppTemplate className="px-5 pt-10">
      <AppHeader>{locales?.inbox}</AppHeader>

      <div className="grid gap-1">
        {mail.length > 0 ? (
          mail.map((m: IEmail) => (
            <Email
              key={m.id}
              sent={false}
              open={() => args?.openEmail(m)}
              {...m}
            />
          ))
        ) : (
          <div className="text-center mt-2">{locales?.noMailFound}</div>
        )}
      </div>
    </AppTemplate>
  );
};
