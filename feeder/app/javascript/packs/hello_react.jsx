// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import Feed from './feed';

import Routes from '../js-routes.js.erb';

const initialPosts = JSON.parse(document.querySelector('#state').dataset.state).posts;

console.log(Routes);
window.routes = Routes;
window.Cable = ActionCable.createConsumer();


function App(props) {
  const [posts, setPosts] = useState(initialPosts);

  useEffect(function() {
    const subscription = Cable.subscriptions.create("FeedChannel", {
      received(newPost) {
        setPosts([...posts, newPost]);
      }
    });

    return function() {
      Cable.subscriptions.remove(subscription);
    };
  }, []);

  return (
    <Feed posts={posts} />
  )
}



document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
