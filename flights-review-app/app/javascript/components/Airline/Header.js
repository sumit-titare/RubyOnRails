import React from "react";

const Header = ({ attributes, reviews }) => {
  // To calculate average of all scores:
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
    <div className="airline-overview">
      <h1 className="airline-header">
        <img src={`${attributes?.image_url}`} alt={attributes?.name} />
        {attributes?.name}
      </h1>
      <div className="total-reviews-count">
        {reviews > 1
          ? `Total reviews: ${reviews.length}`
          : `Total review: ${reviews.length}`}

        <div className="average-score">
          Average rating: {calculateAverage()}
        </div>
      </div>
    </div>
  );
};

export default Header;
