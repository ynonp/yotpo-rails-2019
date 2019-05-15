import React from 'react';

export default function Form(props) {
  const { color } = props;

  return (
    <form>
      <label>
        Title
        <input type="text" />
      </label>
      <label>
        Color
        <input type="text" defaultValue={color} />
      </label>
    </form>
  )
}