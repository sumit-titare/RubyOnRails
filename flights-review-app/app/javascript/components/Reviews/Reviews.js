import React, { useState } from "react";
import Review from "./Review";

const Reviews = ({ reviews }) => {
  return (
    <div className="airline-reviews">
      <h2>User reviews: </h2>
      {reviews.length > 0 &&
        reviews.map((review) => (
          <Review
            key={`review-${review.id}`}
            reviewAttributes={review.attributes}
          />
        ))}
    </div>
  );
};

export default Reviews;
