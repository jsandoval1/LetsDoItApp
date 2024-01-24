// Make a request to the API
fetch('https://type.fit/api/quotes')
    .then(response => response.json())
    .then(data => {
        // Get a random quote from the response
        const randomIndex = Math.floor(Math.random() * data.length);
        const quote = data[randomIndex];

        // Update the HTML with the quote
        document.getElementById('quoteText').textContent = quote.text;
        document.getElementById('quoteAuthor').textContent = quote.author;
    })
    .catch(error => console.error(error));

