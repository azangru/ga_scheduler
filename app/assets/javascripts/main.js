var users = {
  admins: [],
  producers: [],
  instructors: [],
  students: []
};


function getUserInfo(){
  var test = $.ajax({
    type: "GET",
    url: "/users",
    dataType: "json"
  }).done(groupUsers)
}

function groupUsers(data){
  _(data).each(function(user){
    users[(user.role+"s")].push(user);
    // switch(user.role){
    //   case "admin":
    //     users.admins.push(user);
    //     break;
    //   case "producer":
    //     users.producers.push(user);
    //     break;
    //   case "instructor":
    //     users.instructors.push(user);
    //     break;
    //   case "student":
    //     users.students.push(user);
    //     break;
    // }
  });
 printUsers(users);
};

function printUsers(users){

  // $("#user-index").append("<h3>Admins</h3>");
  // _(users.admins).each(function(user){
  //   string = "<p><a href='/users/" + user.id +"'> " + user.full_name + "</a><p>"
  //   $("#user-index").append(string);
  // });
  // $("#user-index").append("<h3>Producers</h3>");
  // _(users.producers).each(function(user){
  //   string = "<p><a href='/users/" + user.id +"'> " + user.full_name + "</a></p>"
  //   $("#user-index").append(string);
  // });
  // $("#user-index").append("<h3>Instructors</h3>");
  // _(users.instructors).each(function(user){
  //   string = "<p><a href='/users/" + user.id +"'> " + user.full_name + "</a></p>"
  //   $("#user-index").append(string);
  // });
  // $("#user-index").append("<h3>Instructors</h3>");
  // _(users.students).each(function(user){
  //   string = "<p><a href='/users/" + user.id +"'> " + user.full_name + "</a></p>"
  //   $("#user-index").append(string);
  // });

  var roles = _(users).keys();
  _(roles).each(function(role){
    var title = role.charAt(0).toUpperCase() + role.slice(1);
    $("#user-index").append("<h3>"+ title +"</h3>");
    _(users[role]).each(function(user){
      string = "<p><a href='/users/" + user.id +"'> " + user.full_name + "</a><p>"
      $("#user-index").append(string);
    });
  })
};


$( document ).ready(function(){
  if (!!$("#user-index").length){
    getUserInfo();  
  }
  
})

// test the presence of the div 

