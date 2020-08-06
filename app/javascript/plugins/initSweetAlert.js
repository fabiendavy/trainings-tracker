import Swal from 'sweetalert2';

const initSweetAlert = () => {
  if (window.location.href.includes('error_swim_unit=true')) {
    Swal.fire({
      title: 'Error !',
      text: 'It seems like you used meters instead of kilometers for your swim distance.',
      icon: 'error',
      confirmButtonText: 'Continue'
    })
  }
  
};

export { initSweetAlert };
