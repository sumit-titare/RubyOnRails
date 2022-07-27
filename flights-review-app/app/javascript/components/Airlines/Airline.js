import React from "react";
import { Link } from "react-router-dom";

const Airline = ({ airline }) => {
  return (
    <div className="airline-details-card">
      <div className="airline-logo">
        <img src={`${airline.image_url}`} alt={airline.name} />
      </div>
      <div className="airline-name">{airline.name}</div>
      <div className="airline-average-score">{airline.average_score}</div>
      <div className="airline-link">
        <Link to={`/airlines/${airline.slug}`}>View airline</Link>
      </div>
    </div>
  );
};

export default Airline;
