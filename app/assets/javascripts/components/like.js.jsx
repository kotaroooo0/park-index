var Like = createReactClass({

  ajaxMain: function(){
    console.log("hello world!");
  }

  render: function(){
    return (
      <button onClick={this.ajaxMain}>いいね！</button>
    );
  }
});
