import React from "react";

const Header = ({ attributes, totalReviews }) => {
  return (
    <div className="airline-overview">
      <h1 className="airline-header">
        <img src={`${attributes?.image_url}`} alt={attributes?.name} />
        {attributes?.name}
      </h1>
      <div className="total-reviews-count">
        {totalReviews > 1
          ? `Total reviews: ${totalReviews}`
          : `Total review: ${totalReviews}`}
      </div>
    </div>
  );
};

export default Header;
