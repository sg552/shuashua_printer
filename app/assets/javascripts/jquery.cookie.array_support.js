/* 
source:  http://stackoverflow.com/questions/1959455/how-to-store-an-array-in-jquery-cookie

USAGE
So on any page you can get the items like this.
var list = new cookieList("MyItems"); // all items in the array.

Adding items to the cookieList
list.add("foo"); 

//Note this value cannot have a comma "," as this will spilt into
//two seperate values when you declare the cookieList.
*/

//This is not production quality, its just demo code.
var cookieList = function(cookieName) {

  //When the cookie is saved the items will be a comma seperated string
  //So we will split the cookie by comma to get the original array
  var cookie = $.cookie(cookieName);

  //Load the items or a new array if null.
  var items = cookie ? cookie.split(/,/) : new Array();

  //Return a object that we can use to access the array.
  //while hiding direct access to the declared items array
  //this is called closures see http://www.jibbering.com/faq/faq_notes/closures.html
  return {
      "add": function(val) {
          //Add to the items.
          items.push(val);
          //Save the items to a cookie.
          $.cookie(cookieName, items);
      },
      "remove": function(val_to_remove) {
          new_array = $.grep(items, function(val) { return val != val_to_remove})
          //Save the items to a cookie.
          $.cookie(cookieName, new_array);
      },
      "clear": function() {
          //clear the cookie.
          $.cookie(cookieName, null);
      },
      "items": function() {
          //Get all the items.
          return items;
      }
    }
}

