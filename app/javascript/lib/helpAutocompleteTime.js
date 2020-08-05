const helpAutocompleteTime = () => {
  const timeInput = document.getElementById('training_time');

  timeInput.addEventListener('keyup', (event) => {
    const value = event.target.value;

    if (/\A(\d{2})\z/.test(value)) {
      timeInput.value = `${timeInput.value}:`; 
    } else if (/\A(\d{2})\:(\d{2})\z/.test(value)) {
      timeInput.value = `${timeInput.value}:`; 
    }
  });
};

export { helpAutocompleteTime };
