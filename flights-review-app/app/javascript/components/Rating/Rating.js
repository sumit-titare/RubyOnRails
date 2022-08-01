import React from "react";

const Rating = ({ score }) => {
  const percentage_score = (score / 5) * 100;
  return (
    <span className="star-wrapper">
      <span className="stars" style={{ width: percentage_score + "%" }}></span>
      {console.log("percentage_score", percentage_score)}
    </span>
  );
};

export default Rating;
