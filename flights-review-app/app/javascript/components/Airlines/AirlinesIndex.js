import React, { useState, useEffect } from "react";
import Axios from "axios";
import Airline from "./Airline";
import { AIRLINES_URL } from "../../endpoints/Endpoints";

const AirlinesIndex = () => {
  const [airlines, setAirlines] = useState([]);

  // const fetchAirlines = async () => {
  //   const { data } = await Axios.get("/api/v1/airlines");
  //   setAirlines(data);
  //   console.log("airlines", data);
  // };

  useEffect(() => {
    Axios.get(`${AIRLINES_URL}`)
      .then((resp) => {
        setAirlines(resp.data.data);
        console.log("airlines", airlines);
      })
      .catch((resp) => console.log(resp));
  }, [airlines.length]);

  // const list = airlines.map((item) => console.log(item));
  return (
    <div className="airlines-index">
      {airlines.map((airline) => (
        <Airline key={airline.id} airline={airline.attributes} />
      ))}
    </div>
  );
};

export default AirlinesIndex;
