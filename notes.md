Stacks - 
A stack is a complete deployment environment including the base operating system, the language runtime and associated libraries. Because of this different stacks support different runtime environments. Celadon Cedar-14 is Heroku's default runtime stack. 

The Process Model - 

The unix process model is a simple and powerful abstraction for running server-side programs. The process model gives a unique way of thinking about dividing our workloads and scaling up over time. THe Cedar stack uses the process model for web, wrker and all other types of dynos.

A dyno is a lightweight linux container that runs a single user-specified command. A dyno can run any command available in its default environment or in your app's slug (a compressed and pre-packaged copy of your application and its dependencies).

Web Dynos: Web dynos are dynos of the 'web' process type that is defined in your Procfile. Only web dynos receive HTTP traffic from Heroku's routers.

Worker Dynos: Worker dynos can be of any process type declared in your Procfile, other than 'web'. Typically used for background jobs, queueing systems, and timed jobs

One-off Dynos: temp dynos that run with their input/output attached to your local terminal. Handle administratived tasks, such as database migrations and console sessions. 

Scalablity
To scale horizontally (scale out), add more dynos. Adding more web dynos allows you to handle more concurrent HTP requests, and therefore higher volumes of traffic. 

To scale vertically (scale up), use bigger dynos. The maximum amount of RAM available to your application depends on the dyno size you use. 

Redundancy - apps with multiple running dynos will be more redundant against failure. If some dynos are lost, the application can continue to process requests while the missing dynos are replaces. Multiple dynos are also more likely to run on different physical infrastructure. 

Each dyno get its own ephemeral filesystem, with a fresh copy of the most recently deployed code. During the dyno's lifetime its running processes can use the filesystem as a temporary scratchpad, but no files that are written are visible to processes in any other dyno and any files written will be discarded the moment the dyno is stopped or restarted.

A running program is called a process. In a production deployment we want the process to be a managed process. 

In multitasking computer operating systems, a daemon is a computer program that runs as a background process, rather than being under the direct control of an interactive user. Traditionally daemon names end with the letter d. A server da

A server is a running instance of an application capable oc accepting requests from the client and giving responses accordingly.

Web apps typically have two or more entry points. Each of these entry points can be called a process type. A basic Rails app will typically have two or more entry points. A basic Rails app will typically have two process types: A Rack-compatible web process type (such as Webrick or Unicorn), and a worker process type using queueing library (such as Delayed Job or Resque). 

A process type is the prototype from which one or more dynos are instantiated. This is similar to the way a class is the prototype from which one or more objects are instantiated in object-oriented programming.

WEBrick - is a Ruby library providing simple HTTP web server services

Rack - a interface for web server to talk to your application

A call stack - is a stack data structure that stores information about the active subroutines of a computer program. Details are normally hidden and automatic in high-level programming languages. A call stack keeps track of the point to which each active subroutine should return control when it finishes executing. An active subroutine is one that has been called but is yet to complete execution after which control should be handed back to the point of call.

A stack or LIFO (last in, first out) is an abstract data type that serves as a collection of elements, with two operations: 
push and pop. The first element popped off a stack is the the last element that was pushed. If the stack is full and does not contain enough space to accept an entity to be pushed, the stack is then considered to be in an overflow state. 