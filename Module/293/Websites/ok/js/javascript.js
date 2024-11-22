document.getElementById("feedbackForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const feedbackText = document.getElementById("feedbackText").value;
    
    // You can replace 'submit.php' with the path to your PHP script
    fetch('submit.php', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams({
        feedbackText: feedbackText
      })
    })
    .then(response => response.text())
    .then(data => {
      document.getElementById("message").textContent = data;
      document.getElementById("feedbackForm").reset();
    })
    .catch(error => {
      console.error('Error:', error);
    });
  });
  