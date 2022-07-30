import React, { useState, useEffect } from "react";
import Axios from "axios";
import { AIRLINES_URL } from "../../endpoints/Endpoints";
import { useParams } from "react-router-dom";
import Header from "./Header";
import Reviews from "../Reviews/Reviews";
import ReviewForm from "../Reviews/ReviewForm";
import { REVIEWS_URL } from "../../endpoints/Endpoints";

const AirlineShow = () => {
  const [airline, setAirline] = useState({});
  const [reviews, setReviews] = useState([]);

  const { slug } = useParams();

  useEffect(() => {
    Axios.get(`${AIRLINES_URL}${slug}`)
      .then((response) => {
        setAirline(response.data);
        setReviews(response.data?.included);
      })
      .catch((response) => {
        console.log("Error in response: ", response);
      });
  }, []);

  //Handle submit of Review:
  const airline_id = parseInt(airline.data?.id);
  const addReview = (review) => {
    //handle submit
    Axios.post(`${REVIEWS_URL}`, { ...review, airline_id })
      .then((response) => {
        setReviews([...reviews, response.data?.data]);
      })
      .catch((response) => console.log(response.data));
  };
  //handle onChange in ReviewForm

  return (
    <div className="airline-details">
      <div className="column">
        {console.log("review", reviews)}
        <Header attributes={airline.data?.attributes} reviews={reviews} />
        <Reviews reviews={reviews} />
      </div>
      <div className="column">
        <ReviewForm
          addReview={addReview}
          airline_name={airline.data?.attributes.name}
        />
      </div>
    </div>
  );
};;;;

export default AirlineShow;
