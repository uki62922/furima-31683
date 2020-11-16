import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <p class="text"><a href ="#" class="comment-user" >${data.nickname}</a>： ${data.content.text}</p>
    `; //ここにHTMLを追加する
    const comments = document.getElementById('comments')
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';  }
});
