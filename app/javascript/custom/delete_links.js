document.addEventListener('DOMContentLoaded', function() {
    var deleteLinks = document.querySelectorAll('.delete-link');

    deleteLinks.forEach(function(deleteLink) {
        // Inside deleteLink.addEventListener('click', ...) block
        deleteLink.addEventListener('click', function(event) {
            event.preventDefault();

            var postId = this.getAttribute('data-post-id');
            var csrfToken = document.querySelector('[name="csrf-token"]').getAttribute('content');

            if (confirm('Are you sure you want to delete this post?')) {
                fetch('/posts/' + postId, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-Token': csrfToken
                    }
                }).then(function(response) {
                    if (response.ok) {
                        console.log('Post deleted successfully');
                        // Reload the current page after successful deletion
                        window.location.reload(); // Move this line here
                    } else {
                        console.error('Failed to delete post');
                    }
                }).catch(function(error) {
                    console.error('An error occurred:', error);
                });
            }
        });
    });
});