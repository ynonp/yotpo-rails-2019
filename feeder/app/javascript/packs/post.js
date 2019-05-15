import React from 'react';

export default function Post({ id, from, text, color }) {
  return (
    <li key={id}>
      <div
        style={{ color }}
      >
        <b>{from}</b> - {text}
      </div>
    </li>
  )
}