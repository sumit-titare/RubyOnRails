import React, { useState, useEffect } from "react";
import Axios from "axios";

const Airlines = () => {
  const [airlines, setAirlines] = useState([]);

  const fetchAirlines = async () => {
    const { data } = await Axios.get("/api/v1/airlines");
    setAirlines(data);
    console.log("airlines", data);
  };

  useEffect(() => {
    fetchAirlines();
  }, [airlines.length]);

  // const list = airlines.map((item) => console.log(item));
  return (
    <div className="airlines-index">
      {airlines.map((airline_data) => {
        console.log("inside", airline_data);
      })}
    </div>
  );
};

export default Airlines;
{
  /* <div className="airline-tile">
            <div className="airline-name">{print("dsdf")}</div>
            <div className="airline-logo">
              <img src="" alt="" />
            </div>
            <div className="airline-slug"></div>
          </div>; */
}
