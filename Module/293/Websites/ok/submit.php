<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $feedbackText = $_POST["feedbackText"];
    $to = "robloxi644@gmail.com"; // Replace with your email address
    $subject = "Feedback";
    $headers = "From: webmaster@example.com"; // Replace with your website's email address
    $message = $feedbackText;
    
    if (mail($to, $subject, $message, $headers)) {
        echo "Thank you for your feedback! We have received your message.";
    } else {
        echo "Oops! Something went wrong. Please try again later.";
    }
} else {
    echo "Access denied.";
}
?>
