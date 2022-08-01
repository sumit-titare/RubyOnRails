import React from "react";
import Rating from "../Rating/Rating";

const Review = ({ reviewAttributes }) => {
  return (
    <div className="airline-review">
      <div className="review-title">{reviewAttributes?.title}</div>
      <div className="review-description">
        Review: {reviewAttributes?.description}
      </div>
      <div className="airline-score">
        <Rating score={reviewAttributes?.score} />
      </div>
      <div className=""></div>
    </div>
  );
};

export default Review;
