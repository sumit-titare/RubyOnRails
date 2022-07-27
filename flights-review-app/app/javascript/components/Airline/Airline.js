import React, { useState, useEffect } from "react";
import Axios from "axios";
import { AIRLINE_SHOW_URL } from "../../endpoints/Endpoints";
import { useParams } from "react-router-dom";

const Airline = () => {
  const [airline, setAirline] = useState({});
  const [reviews, setReviews] = useState([]);
  const { slug } = useParams();

  useEffect(() => {
    Axios.get(`${AIRLINE_SHOW_URL}${slug}`)
      .then((response) => {
        setAirline(response.data.data);
      })
      .catch((response) => {
        console.log("response", response);
      });
  }, []);

  return (
    <div className="airline-details">
      {airline.nil ? "dsd" : console.log("aunfjn", airline)}
      {/* <div className="airline-name">{airline.attributes.name}</div>
     <div className="airline-logo">
        <img
          src={`${airline.attributes.image_url}`}
          alt={airline.attributes.name}
        />
      </div> */}
      <div className="airline-reviews"></div>
    </div>
  );
};

export default Airline;
