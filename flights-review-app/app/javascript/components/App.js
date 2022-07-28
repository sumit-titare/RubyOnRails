import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import AirlinesIndex from "./Airlines/AirlinesIndex";
import AirlineShow from "./Airline/AirlineShow";
import "./App.css";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route exact path="/" element={<AirlinesIndex />}></Route>
        <Route exact path="/airlines/:slug" element={<AirlineShow />}></Route>
      </Routes>
    </Router>
  );
};

export default App;
