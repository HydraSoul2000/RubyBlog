document.addEventListener('DOMContentLoaded', function() {
    var postCards = document.querySelectorAll('.post-card');

    postCards.forEach(function(postCard) {
        var dropdownButton = postCard.querySelector('.dropdown-toggle');

        // Prevent dropdown button click from triggering card click
        dropdownButton.addEventListener('click', function(event) {
            event.stopPropagation();
            // Toggle the dropdown menu
            var dropdownMenu = this.nextElementSibling;
            dropdownMenu.classList.toggle('show');
        });

        // Inside postCard.addEventListener('click', ...) block
        postCard.addEventListener('click', function(event) {
            var deleteLink = postCard.querySelector('.delete-link');
            if (deleteLink && deleteLink.contains(event.target)) {
                // Click on delete link, don't trigger card redirection
                window.location.reload(); // Move this line outside the condition
                return;
            }

            if (!window.location.href.includes('/edit')) {
                var postId = postCard.getAttribute('data-post-id');
                window.location.href = '/posts/' + postId;
            }
        });
    });

    // Close dropdowns when clicking outside
    document.addEventListener('click', function(event) {
        var dropdowns = document.querySelectorAll('.dropdown-menu');
        dropdowns.forEach(function(dropdown) {
            if (!dropdown.contains(event.target)) {
                dropdown.classList.remove('show');
            }
        });
    });
});