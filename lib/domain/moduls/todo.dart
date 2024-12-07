/* 

TO DO MODEL

this is what a todo object 

--------------------------------------------------------------------------------------------------

it has there properties:

-id
-text
-isComplete

methods:

- toggle complete on & off  

*/

class Todo {
  final int id;
  final String text;
  final bool isComplete;

  Todo({
    required this.id,
    required this.text,
    this.isComplete = false, // intially, todo is incomplete
  });

  Todo toogleCompletion() {
    return Todo(
      id: id,
      text: text,
      isComplete: !isComplete,
    );
  }
}
