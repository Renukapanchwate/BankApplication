<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bank Details</title>
    <script>
        function closePopup() {
            // Close the popup
            document.getElementById("popup").style.display = "none";
        }

        function copyIFSC() {
            // Copy IFSC number to clipboard
            var ifsc = document.getElementById("ifsc").innerText;
            navigator.clipboard.writeText(ifsc)
                .then(function() {
                    alert("IFSC number copied to clipboard!");
                })
                .catch(function(err) {
                    console.error('Failed to copy: ', err);
                });
        }
    </script>
    <style>
        /* Style for popup */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f9f9f9;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            z-index: 9999;
        }

        /* Style for close button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        /* Style for copy button */
        .copy {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<!-- Popup -->
<div id="popup" class="popup">
    <span class="close" onclick="closePopup()">&times;</span>
    <h2 id="bankName">Bank Name</h2>
    <p id="ifsc">IFSC Number</p>
    <button class="copy" onclick="copyIFSC()">Copy IFSC</button>
</div>

<!-- Button to trigger the popup -->
<button onclick="document.getElementById('popup').style.display='block'">Show Bank Details</button>

