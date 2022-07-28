import React, { useState } from "react";
import Review from "./Review";

const Reviews = ({ reviews }) => {
  let totalScore = 0,
    average = 0;

  const calculateAverage = () => {
    if (reviews.length === 0) {
      return 0;
    }
    reviews.map((r) => (totalScore += r.attributes?.score));
    return (average = totalScore / reviews.length);
  };

  return (
    <div className="airline-reviews">
      <div className="average-score">Average rating: {calculateAverage()}</div>
      {reviews.length > 0 &&
        reviews.map((review) => (
          <Review key={review.id} reviewAttributes={review.attributes} />
        ))}
    </div>
  );
};

export default Reviews;
