import React from "react";

const Review = ({ reviewAttributes }) => {
  return (
    <div className="airline-review">
      <div className="review-title">{reviewAttributes.title}</div>
      <div className="review-description">
        Review: {reviewAttributes.description}
      </div>
      <div className="airline-score">
        Rating: {reviewAttributes.score} out of 5:
      </div>
      <div className=""></div>
    </div>
  );
};

export default Review;
