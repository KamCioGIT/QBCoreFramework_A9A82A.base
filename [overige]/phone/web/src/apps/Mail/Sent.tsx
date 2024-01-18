import React, { FC, useEffect, useState } from "react";
import { Email, IEmail } from ".";
import AppTemplate, { AppHeader } from "../../components/AppTemplate";
import { IPageElement } from "../../components/Pages";
import { post } from "../../lib/post";
import { useCore } from "../../providers/CoreProvider";

const Sent: FC<IPageElement> = ({ args }) => {
  const [mail, setMail] = useState([]);
  const { locales } = useCore();

  useEffect(() => {
    post("getMailSent").then((mail: any) => {
      setMail(mail);
    });

    const listener = (evt: any) => {
      if (evt.data.type === `mail:refreshSent`) {
        setMail(evt.data.mail);
      }
    };

    window.addEventListener("message", listener);

    return () => {
      window.removeEventListener("message", listener);
    };
  }, []);

  return (
    <AppTemplate className="px-5 py-10">
      <AppHeader>{locales?.sent}</AppHeader>

      <div className="grid gap-1">
        {mail.length > 0 ? (
          mail.map((m: IEmail) => (
            <Email
              key={m.id}
              open={() => args?.openEmail({ ...m, sent: true })}
              sent={true}
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

export default Sent;
