function js_event() {
  const nav = document.getElementById('click');
  
  if (nav.style.display == 'block'){
    nav.style.display = 'none';
  }else{
    nav.style.display = 'block';
  }
}
