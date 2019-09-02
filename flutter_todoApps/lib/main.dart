import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var timer = new TodoSplash();
    return MaterialApp(
      title: 'Todo List',
      color: Colors.redAccent,
      theme: ThemeData(fontFamily: 'Sansserif'),
      debugShowCheckedModeBanner: false,
      home: timer,
    );
  }
}

class TodoSplash extends StatefulWidget {
  @override
  createState() => TodoSplashState();
}

class TodoSplashState extends State<TodoSplash> {
  void _changeColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    new Timer(
      new Duration(
        seconds: 3,
      ),
      () {
        _changeColor(Colors.blue);
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) {
            return new Scaffold(
              body: new TodoList(),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _changeColor(Colors.redAccent);
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: 2,
                child: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: new Icon(
                          Icons.list,
                          color: Colors.teal,
                          size: 50.0,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                      ),
                      new Text(
                        'Todo Apps',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Column(
                  //main
                  children: <Widget>[
                    new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.pinkAccent,
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                      ),
                    ),
                    new Text(
                      'Loading...',
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List colors = [
    Color(0x5997c3f0),
    Color(0x59eef683),
    Color(0x59656a25),
    Color(0x59d4e311)
  ];
  List<String> _todoItems = [
    "Call has to setup with sales team at 6:00PM",
    "Meeting with Alex at Green Park",
    "New Agenda Would like to setup for QTR3"
  ];
  TextEditingController todoName = new TextEditingController();
  Random _random = new Random(3);

  //Adding the Item Code
  void _addTodoItems(String task, int index, BuildContext context) {
    if (task != "" && index == -1) {
      //Removing the Add New Task Navigation
      Navigator.of(context).pop();
      todoName.text = "";
      setState(() {
        _todoItems.add(task);
      });
      _displayAddedSuccessfully(1);
    } else if (task != '' && index > -1) {
      Navigator.of(context).pop();
      todoName.text = "";
      setState(() {
        _todoItems[index] = task;
      });
      _displayAddedSuccessfully(3);
    } else {
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return new AlertDialog(
      //         title: new Text('The Task Can not be empty'),
      //         actions: <Widget>[
      //           new FlatButton(
      //             child: new Text('Ok'),
      //             onPressed: () => Navigator.of(context).pop(),
      //           )
      //         ],
      //       );
      //     });
      _changeColor(Colors.redAccent);
      _pushEmptyWarnigMessage('');
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(
            'Mark "${_todoItems[index]}" as done?',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            new FlatButton(
              child: new Text('MARK AS DONE'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
                _changeColor(Colors.white);
              },
            )
          ],
        );
      },
    );
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            child: _buildTodoItem(_todoItems[index], index),
          );
        }
      },
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {
    int color = _random.nextInt(3);
    return new Card(
      child: Container(
        color: colors[color],
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                todoText,
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(''),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Container(
                        width: 30,
                        child: new FlatButton(
                          // color: Colors.yellow,
                          child: new Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            _changeColor(Colors.redAccent);
                            _pushDeleteTodoScreen(index);
                          },
                        ),
                      ),
                      new SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 40,
                        child: new FlatButton(
                          // color: Colors.yellow,
                          child: new Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            _changeColor(Colors.redAccent);
                            _pushAddTodoScreen(todoText, index);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _pushDeleteTodoScreen(int index) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          _changeColor(Colors.redAccent);
          return new Scaffold(
            body: Container(
              color: Colors.redAccent,
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 65),
                      child: new Image(
                        image: AssetImage('assets/error.png'),
                        alignment: Alignment.center,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: new Text(
                        'Would you like to remove the Item "${_todoItems[index]}" ? ',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 20,
                    ),
                    new Container(
                      color: Colors.red,
                      child: new OutlineButton(
                        child: new Text(
                          'Remove',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        borderSide: new BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 120,
                          vertical: 15,
                        ),
                        onPressed: () {
                          _removeTodoItem(index);
                          Navigator.of(context).pop();
                          _displayAddedSuccessfully(2);
                        },
                      ),
                    ),
                    new SizedBox(
                      height: 10,
                    ),
                    new OutlineButton(
                      child: new Text(
                        'Cancel',
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 125,
                        vertical: 15,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _changeColor(Colors.blue);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _pushAddTodoScreen([String strTodoText = '', int index = -1]) {
    _changeColor(Colors.blue);
    todoName.text = index == -1 ? '' : strTodoText;
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text(index == -1 ? 'Add a New Task' : 'Edit Task'),
            ),
            body: new Center(
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: new Image(
                      image: AssetImage('assets/Example.png'),
                      alignment: Alignment.center,
                      height: 230,
                      width: 230,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: new TextField(
                      controller: todoName,
                      obscureText: false,
                      // style: new TextStyle(
                      //   fontSize: 18,
                      // ),
                      autofocus: true,
                      autocorrect: true,
                      onSubmitted: (val) {
                        // print(todoName.text);
                        _changeColor(Colors.redAccent);
                        _addTodoItems(val, index, context);
                      },
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          prefixText: ' ',
                          hintText: 'Enter the New Task Name',
                          contentPadding: const EdgeInsets.all(15.0),
                          labelText: 'Task Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          helperText:
                              'Keep your new task name, as you would like to add.'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: new OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90,
                        vertical: 15,
                      ),
                      child: new Text(
                        index == -1 ? 'Add' : 'Update',
                        style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        _addTodoItems(todoName.text, index, context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _noRecordFound(BuildContext context) {
    _changeColor(Colors.blue);
    return Center(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: new Image(
              image: AssetImage('assets/no-record.png'),
              alignment: Alignment.center,
              height: 250,
              width: 250,
            ),
          ),
          new SizedBox(
            height: 20,
          ),
          new Text(
            'No Record found !',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          new SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: new Text(
              'click on "Add task" to add new item',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _displayAddedSuccessfully(int opperation) {
    _changeColor(Colors.white);
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        return new Scaffold(
          body: Container(
            color: Colors.white,
            child: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 50,
                    ),
                    child: new Text(
                      (opperation == 1
                              ? 'Added'
                              : (opperation == 2 ? 'Removed' : 'Updated')) +
                          ' Successfully !',
                      style: new TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  new Image(
                    image: AssetImage('assets/done-image.png'),
                    alignment: Alignment.center,
                    height: 130,
                    width: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: new OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.green,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 17,
                      ),
                      child: new Text(
                        'Done !',
                        style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.green,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _changeColor(Colors.blue);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  _pushEmptyWarnigMessage(String strTodoName) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            body: Container(
              color: Colors.redAccent,
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 50,
                      ),
                      child: new Image(
                        image: AssetImage('assets/warning.png'),
                        height: 150,
                        width: 150,
                        alignment: Alignment.center,
                      ),
                    ),
                    new Text(
                      'Todo name can not be empty.',
                      style: new TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    new SizedBox(
                      height: 50,
                    ),
                    new OutlineButton(
                      child: new Text(
                        'okay',
                        style: new TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 15,
                      ),
                      borderSide: new BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _changeColor(Colors.blue);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _changeColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xF2eff0f1),
      child: new Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body:
            _todoItems.length == 0 ? _noRecordFound(context) : _buildTodoList(),
        floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          tooltip: 'Add Task',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}
