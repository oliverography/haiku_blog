$( ".button.enter" ).click(function() {
  // inserts sign-in-up section
  $( "body" ).append( "<section id='sign'><iframe src='' frameBorder='0'><p>Your browser does not support iframes.</p></iframe></section>" );
  // replaces img src with data-iframe value
  var iframeSrc = $(this).data("iframe")
  $("iframe").attr('src', iframeSrc);
  // sign-in-up section slides out
  $( "#landing" ).animate({
    right: "500px",
  }, 1000 );
  $( "#sign" ).animate({
    right: "0px",
  }, 1000 );
});

// $( "#landing" ).click(function() {
//   $( "#landing" ).animate({
//     right: "0px",
//   }, 1000 );
//   $( "#sign" ).animate({
//     right: "-500px",
//   }, 1000 );
//   // remove sign-in-up section
//   setTimeout(function() { 
//     $( "#sign" ).remove();
//   }, 1000);
// });