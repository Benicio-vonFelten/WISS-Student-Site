import { GigasetElementsApi } from "gigaset-elements-api";

const api = new GigasetElementsApi({
  email: "cad@architekten.ch",
  password: "Lolo-65-Bi",
});

/* {
    // required
    email: "<email>", // username/email for accessing GE cloud
    password: "<password>", // password of accessing GE cloud
    // optional
    authorizeHours: 6, // defaults to 6, number of hours after which GE cloud needs reauthorization
    requestLogger: (message: string) => void, // for logging all http requests
  } */