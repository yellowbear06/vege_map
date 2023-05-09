const avatarInput = document.querySelector('#user_avatar');
const avatarPreview = document.querySelector('#preview');

avatarInput.addEventListener('change', function(event) {
  const file = event.target.files[0];
  const reader = new FileReader();
  reader.addEventListener('load', function(event) {
    avatarPreview.src = event.target.result;
  });
  reader.readAsDataURL(file);
});