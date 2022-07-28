import React, { useState, useEffect } from "react";
import Axios from "axios";
import { AIRLINES_URL } from "../../endpoints/Endpoints";
import { useParams } from "react-router-dom";
import Header from "./Header";
import Reviews from "../Reviews/Reviews";
import ReviewForm from "../Reviews/ReviewForm";

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

  return (
    <div className="airline-details">
      <div className="column">
        {console.log("review", reviews)}
        <Header attributes={airline.data?.attributes} reviews={reviews} />
        <Reviews reviews={reviews} />
      </div>
      <div className="column">
        <ReviewForm />
      </div>
    </div>
  );
};

export default AirlineShow;
