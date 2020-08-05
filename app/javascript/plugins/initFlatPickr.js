import flatpickr from "flatpickr";

const initFlatPickr = () => {
  flatpickr("#training_date", {
    "locale": {
      "firstDayOfWeek": 1 // start week on Monday
    },
    "dateFormat": "d-m-Y"
  });
};

export { initFlatPickr };
