import React, { Fragment, useState } from "react";
import Review from "./Review";

const ratingOptionValues = [1, 2, 3, 4, 5];

const ReviewForm = ({ addReview, airline_name }) => {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [score, setScore] = useState(0);

  const handleSubmit = (e) => {
    e.preventDefault();

    const review = {
      title: title,
      description,
      score,
    };
    addReview(review);
    //Setting the state to nil
    setTitle("");
    setDescription("");
    setScore(0);
  };

  const ratingOptions = ratingOptionValues.map((score, index) => {
    return (
      <Fragment key={index}>
        <input
          type="radio"
          name="rating"
          id={`rating-${score}`}
          key={`rating-${score}`}
          value={score}
          onChange={(e) => setScore(e.target.value)}
        />
        <label key={`rating-label-${score}`} htmlFor={score}></label>
      </Fragment>
    );
  });

  return (
    <div className="review-form">
      <form onSubmit={handleSubmit}>
        <div className="review-headline">
          Share your experience with {airline_name}
        </div>
        <div className="review-fields">
          <div className="review-title">
            <input
              type="text"
              name="title"
              placeholder="Add your title here.."
              onChange={(e) => setTitle(e.target.value)}
              value={title}
            />
          </div>
          <div className="review-description">
            <textarea
              name="description"
              placeholder="Share your experience here.."
              onChange={(e) => setDescription(e.target.value)}
              value={description}
            />
          </div>
        </div>
        <div className="rating-container">
          <div className="rating-container-title">Rate this Airline</div>
          <div className="airline-rating">{ratingOptions}</div>
        </div>

        <button className="submit-review" type="submit">
          Submit
        </button>
      </form>
    </div>
  );
};

export default ReviewForm;
