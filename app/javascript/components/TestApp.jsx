import React, {Component, useState, useEffect} from "react"
import {Jumbotron} from 'react-bootstrap';
import PropTypes from "prop-types"

export default function TestApp(props) {
  const [things, setThings] = useState([]);

  useEffect(() => {

    const fetchData = async () => {
      const response = await fetch(`${props.apiUrl}/things/`);
      const data = await response.json()
      return data
    }
    const json = fetchData()
    setThings(json.data)
  }, []);

  return <div>
    <h1>Things</h1>
    <ul>{
      things.map(thing => {
        <li>{thing.name}</li>
      })
    }</ul>
  </div>;
}

TestApp.propTypes = {
  apiUrl: PropTypes.string.isRequired
}