const tabCurrentData = () => {
  const tabs = Array.from(document.querySelectorAll('#current-week-month button'));
  const divs = Array.from(document.querySelectorAll('.current-tabs'));

  tabs.forEach(tab => {
    tab.addEventListener('click', (event) => {
      for (let i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove('active-tab');
      }
      tab.classList.add('active-tab');
      
      const currentValue = tab.innerHTML.toLowerCase().split(' ').join('-');

      divs.forEach(div => {
        for (let j = 0; j < divs.length; j++) {
          divs[j].style.display = 'none';
        }
      });
      document.getElementById(currentValue).style.display = 'block';
    });
  });
};

export { tabCurrentData }; 
