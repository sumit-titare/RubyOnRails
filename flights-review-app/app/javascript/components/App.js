import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Airlines from "./Airlines/Airlines";
import Airline from "./Airline/Airline";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route exact path="/" element={<Airlines />}></Route>
        <Route exact path="/airlines/:slug" element={<Airline />}></Route>
      </Routes>
    </Router>
  );
};

export default App;
