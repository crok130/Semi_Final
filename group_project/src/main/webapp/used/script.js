// script.js

// Toggle dropdown for subcategories
function toggleDropdown(dropdownId) {
  var dropdown = document.getElementById(dropdownId);
  dropdown.classList.toggle('active');
}

// Form submission handling
document.getElementById('used-book-form').addEventListener('submit', function(event) {
  event.preventDefault();

  // Gather form data
  var bookTitle = document.getElementById('book-title').value;
  var bookAuthor = document.getElementById('book-author').value;
  var bookISBN = document.getElementById('book-isbn').value;
  var bookPrice = document.getElementById('book-price').value;
  var bookCondition = document.getElementById('book-condition').value;
  var bookDescription = document.getElementById('book-description').value;
  // Here you would handle file uploads, but it's not implemented in this example

  // Perform validation (example: simple check for book title presence)
  if (bookTitle.trim() === '') {
      alert('도서명을 입력해주세요.');
      return;
  }

  // Construct object with book data (you can send this data to a server, for example)
  var bookData = {
      title: bookTitle,
      author: bookAuthor,
      isbn: bookISBN,
      price: bookPrice,
      condition: bookCondition,
      description: bookDescription
      // Add file upload handling here if needed
  };

  // Example: log book data to console (replace with actual implementation)
  console.log('Book Data:', bookData);

  // Reset form fields (optional)
  document.getElementById('used-book-form').reset();
});
const categoryItems = document.querySelectorAll('.category li');

window.addEventListener('scroll', () => {
  categoryItems.forEach(item => {
    const itemTop = item.getBoundingClientRect().top;
    const windowHeight = window.innerHeight;

    if (itemTop < windowHeight * 0.8) { // 80% 지점에 도달하면 나타남
      item.classList.add('show');
    }
  });
});