# ****************************************************************************
#
# Copyright (c) Microsoft Corporation. 
#
# This source code is subject to terms and conditions of the Microsoft Public License. A 
# copy of the license can be found in the License.html file at the root of this distribution. If 
# you cannot locate the  Microsoft Public License, please send an email to 
# ironruby@microsoft.com. By using this source code in any fashion, you are agreeing to be bound 
# by the terms of the Microsoft Public License.
#
# You must not remove this notice, or any other, from this software.
#
#
# ****************************************************************************

require File.dirname(__FILE__) + "/../tutorial"

module IronRubyTutorial
  def self.files_path
    File.dirname(__FILE__) + '/ironruby_files'
  end
  
  def self.primes_path
    files_path + '/primes.rb'
  end
  
  def self.load_xml_path
    files_path + '/load.xml'
  end
  
  def self.load_xml_relative_path
    require 'pathname'
    Pathname.new(load_xml_path).relative_path_from(Pathname.new(Dir.pwd))
  end
  
  def self.calc_xaml_path
    files_path + '/calc.xaml'
  end
  
  def self.calc_xaml_relative_path
    require 'pathname'
    Pathname.new(calc_xaml_path).relative_path_from(Pathname.new(Dir.pwd))
  end
  
  def self.wpf_path
    File.expand_path '../../wpf.rb', files_path
  end
    
  def self.snoop_add_handler name, obj
  puts caller if not obj
    Tutorial.snoop_add_handler self, name, obj
  end
end

$LOAD_PATH << IronRubyTutorial.files_path
$LOAD_PATH << IronRubyTutorial.files_path + '/../..' # for "wpf.rb"

# All strings use the RDoc syntax documented at 
# http://www.ruby-doc.org/stdlib/libdoc/rdoc/rdoc/index.html

tutorial "IronRuby tutorial" do

    legal %{
        Information in this document is subject to change without notice. The example companies,
        organizations, products, people, and events depicted herein are fictitious. No association with any
        real company, organization, product, person or event is intended or should be inferred. Complying with
        all applicable copyright laws is the responsibility of the user. Without limiting the rights under
        copyright, no part of this document may be reproduced, stored in or introduced into a retrieval
        system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording,
        or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

        Microsoft may have patents, patent applications, trademarked, copyrights, or other intellectual
        property rights covering subject matter in this document. Except as expressly provided in any written
        license agreement from Microsoft, the furnishing of this document does not give you any license to
        these patents, trademarks, copyrights, or other intellectual property.

        (c) Microsoft Corporation. All rights reserved.

        Microsoft, MS-DOS, MS, Windows, Windows NT, MSDN, Active Directory, BizTalk, SQL Server, SharePoint,
        Outlook, PowerPoint, FrontPage, Visual Basic, Visual C++, Visual J++, Visual InterDev, Visual
        SourceSafe, Visual C#, Visual J#,  and Visual Studio are either registered trademarks or trademarks of
        Microsoft Corporation in the U.S.A. and/or other countries.

        Other product and company names herein may be the trademarks of their respective owners
    }
    
    introduction %{
        IronRuby is the .NET[http://www.ecma-international.org/publications/standards/Ecma-335.htm]
        implementation of the {Ruby programming language}[http://www.ruby-lang.org/]. It's a dynamically 
        typed language with support for many programming paradigms such as object-oriented programming, 
        and also allows you to seamlessly use CLI code. 

        The goal of this tutorial is to quickly familiarize you with using IronRuby interactively, and to 
        show you how to make use of the extensive .NET libraries available.  This tutorial also shows you 
        how to get started in more specialized areas such as interoperating with COM.
        
        You can find more resources about IronRuby at http://ironruby.net.
    }

    section "Basic IronRuby - Introduction to the IronRuby interactive window" do
    
        introduction %{
            The objective of this tutorial is to launch the IronRuby interpreter, explore the environment
            of the interactive console and use IronRuby to interact with .NET libraries.
        }

        chapter "The interactive REPL window" do
            introduction %{
                This chapter explains the basic usage of a REPL window. REPL is an acronym for 
                <b>R</b>ead, <b>E</b>val, <b>P</b>rint, <b>L</b>oop. One of the big advantages of dynamic languages
                is the ability to do interactive exporation of new APIs and libraries from a REPL 
                window. You can enter expressions using the API you are exploring, and the results
                are immediately displayed. Depending on the result, you can chose to try different
                expressions. You can thus build programs in this fashion while avoiding a
                compile step after every operation.
            }

            task :body => %{
                    Let's start with a simple expression to add two numbers. Enter the expression below,
                    followed by the +Enter+ key. The expression and its result will be shown in the output 
                    window below the text-box where you enter the expression.
                  },
                  :code => '2 + 2'

            task(:body => "Now let's do some printing. This is done with the puts function.",
                 :code => "puts 'Hello world'"
                 ) { |i| i.output =~ /Hello/i }

            task(:body => "Let's use a local variable.",
                 :code => "x = 1"
                 ) { |i| i.bind.x == 1 }

            task(:body => "And then print the local variable.",
                 :code => "puts x"
                 ) { |i| i.output.chomp == "1" }
        end
        
        chapter "Multi-line statements" do
            introduction "This chapter explains how multi-line statements can be used in the tutorial"
            task(
              :body => %{
                Entering multiple lines in an interactive console can be a bit tricky as it is not an editor.
                You cannot go back and change a prior line. If you realized you mis-typed something, you
                need to enter all the lines again.
                
                After you enter the first line, the prompt characters shown at the start of the input textbox 
                change from ">>>" to "..." to indicate to the user that more lines are expected before the 
                input will be evaluated.
              },
              :code => %{
                if 2 < 3
                  puts "Ofcourse"
                else
                  puts "No way!"
                end}.strip_margin
              ) { |interaction| interaction.output =~ /ofcourse/i }
        end
        
        chapter "Built-in modules and interactive exploration" do
        
            task :body => %{
                     You can ask any object for the list of methods it supports. To see all the methods
                     available on a string, try this.
                 },
                 :code => "'Hello'.methods.sort"
            
            task :body => %{
                     You can also ask the object for its class and then use the +instance_methods+ method.
                     Both of the following statements are equivalent.
                     
                       'Hello'.class.instance_methods
                       String.instance_methods
                     
                     The advantage of using +instance_methods+ is that you can pass an argument to indicate
                     whether to include methods defined by superclasses, for example, to narrow down the
                     results of <tt>'Hello'.methods.sort</tt> to only those methods that are unique to 
                     Strings.
                 },
                 :code => "'Hello'.class.instance_methods(false).sort"
            
            task :body => %{
                     All loaded classes are exposed as constants in the +Object+ class. Let's take a look
                     at all the classes currently loaded.
                 },
                 :code => 'Object.constants.sort'
            
            task(:body => %{
                     IronRuby comes with several built-in modules. Some are loaded when IronRuby starts up
                     as you saw above. Some need to be explicitly loaded. This is done with the the +require+
                     function. Let's load the +thread+ module.
                 },
                 :setup => Proc.new { $LOADED_FEATURES.delete "thread.rb" },
                 :code => "require 'thread'"
                 ) { $LOADED_FEATURES.include? 'thread.rb' }
                 
            task :body => %{
                     Now let's see which new classes were loaded. Can you spot the new classes using
                     <tt>Object.constants.sort</tt> again? +Mutex+ is one of them. There are three others.
                 },
                 :code => 'Object.constants.sort'

            task :body => %{
                     You can see the methods of a class using methods like +public_methods+.
                 },
                 :code => 'Object.public_methods.sort'
        end

        chapter "User-defined modules" do
        
            task(:body => %{
                     This chapter uses the file <tt>primes.rb</tt>. Let's load it using the +require+
                     function. The +require+ function accepts relative as well as absolute paths. A file
                     extension can be specified, or it can be left out. All of the following statements are
                     equivalent.
                     
                       require 'primes'
                       require 'primes.rb'
                       require './primes.rb'
                 },
                 :source_files => IronRubyTutorial.primes_path,
                 :setup => Proc.new { $LOADED_FEATURES.delete "primes.rb" },
                 :code => "require 'primes.rb'"
                 ) { $LOADED_FEATURES.include? 'primes.rb' }

            task :body => %{
                    We know that the file defines a module called +Primes+. Let's explore the methods defined
                    in the module using the +method+ function. By default, this method shows all the methods
                    available on the class, including those defined by +Object+. Since we are not interested
                    in the methods defined by +Object+, we pass an argument of +false+ to exclude
                    methods defined by superclasses.
                },
                :code => 'Primes.methods(false)'

            task :body => %{
                    Now let's call the +is_prime+ method.
                },
                :code => 'Primes.is_prime(10)'
        end
            
    end

    section "Basic IronRuby - Using the standard .NET libraries" do
    
        introduction %{
            The power of IronRuby lies within the ability to seamlessly access the wealth of .NET libraries.
            This exercise will demonstrate how the .NET libraries can be used from IronRuby .
        }
        
        chapter "Basic .NET library use" do
            task :body => %{
                    IronRuby automatically loads mscorlib.dll, the core .NET library where many of the
                    basic types are defined. .NET namespaces behave like Ruby modules. Let's look at all the
                    types and sub-namespaces defined in the +System+ namespace.
                },
                :code => 'System.constants'

            task :body => %{
                    Explore the <tt>System.Environment</tt> class.                    
                },
                :code => 'System::Environment.methods(false).sort'

            task :body => %{
                    Let's call the +OSVersion+ property.
                },
                :code => 'System::Environment.OSVersion'

            task :body => %{
                    You can assign the class names to local constants for easier access. Here is how you can
                    use just <tt>E.OSVersion</tt> instead of having to say <tt>System::Environment.OSVersion</tt>
                },
                :code => ['E = System::Environment', 'E.OSVersion']

            task :body => %{
                    You can also use the +include+ method to import contents of a class or namespace. This
                    will allow direct access to all the classes and sub-namespaces under +System+. For
                    example, <tt>System::Environment</tt> is now directly accessible.
                },
                :code => ['include System', 'Environment.OSVersion']
        end

        chapter "Working with .NET classes" do
            task :body => %{
                    Import the contents of the <tt>System::Collections</tt> namespace into the global namespace.
                },
                :code => 'include System::Collections'

            task :body => %{
                    Create instance of the Hashtable class and explore the instance using +instance_methods+.
                },
                :code => ['h = Hashtable.new', 'h.class.instance_methods']

            task(:body => %{
                    Insert a few elements into the hash table
                },
                :code => [
                    "h[:a] = 'IronRuby'", 
                    "h[:b] = 'Tutorial'"]
                ) { |i| i.bind.h.count == 2 }

            task :body => %{
                    IronRuby supports the C# - style syntax for accessing the hash table elements. The same 
                    syntax applies to any indexable object (.NET arrays, System::Collections::ArrayList, etc).
                },
                :code => 'h[:a]'

            task(:body => %{
                    Enumerate the contents of the hash table using the +each+ method. The hash table elements 
                    are instances of the +DictionaryEntry+ class. Print the +Key+ and +Value+ properties of
                    each entry.
                },
                :code => 'h.each { |e| puts "#{e.Key}=>#{e.Value}" }'
                ) { |i| /a=>IronRuby/ =~ i.output }

            task(:body => %{
                    You can initialize the collection classes by passing in the Ruby built-in list as
                    arguments.
                },
                :code => [
                    'l = ArrayList.new([1,2,3])', 
                    'l.each { |i| puts i }']
                ) { |i| /1\n2\n3/ =~ i.output }
        end

        chapter "Generics" do
            task :body => %{
                    Import the Generic collections from the <tt>System::Collections::Generic</tt> namespace.
                },
                :code => 'include System::Collections::Generic'

            task(:body => %{
                    To instantiate a generic class, the generic type arguments must be specified. IronRuby
                    uses the following syntax to specify the type arguments
                    
                      generic_type[type_argument, ...]
                   
                   Create an instance of a generic dictionary mapping Strings to Fixnums
                },
                :code => 'd = Dictionary[String, Fixnum].new'
                ) { |i| i.bind.d.class == Dictionary[String, Fixnum] }

            task(:body => %{
                    Add string values into the list. Since we created a list of string, adding strings is possible.
                },
                :code => [
                    "d['Hello'] = 1", 
                    "d['Hi'] = 2"]
                ) { |i| i.bind.d.count == 2 }

            task(:body => %{
                    Try adding objects of types other than string. It will fail with a TypeError
                },
                :code => 'd[3] = 3'
                ) { |i| i.error.kind_of? TypeError }

            task(:body => %{
                    Enumerate the generic collection
                },
                :code => 'd.each { |kvp| puts kvp }'
                ) { |i| /Hello/ =~ i.output }
        end
    end

    section "Basic IronRuby - Loading .NET libraries" do
        introduction %{
            IronRuby can import .NET libraries using either the +require+ standard Ruby method, or the 
            IronRuby-specific +load_assembly+ method.
        }
        
        chapter "Using System.Xml - load_assembly" do

            task :body => %{
                    To use the <tt>System::Xml</tt> namespace, the System.Xml.dll assembly must first be
                    loaded by IronRuby engine. Note that it is not sufficient for the assembly to have been
                    loaded by .NET into the AppDomain with methods like <tt>System.AppDomain.LoadAssembly</tt>.
                },
                :code => ["load_assembly 'System.Xml'", 'include System::Xml']

            task(:body => %{
                    Note that the load_assembly method accepts either a full assembly name or a partial assembly 
                    name (or even a file name - more on that later). It is strongly recommended using the full
                    assembly name in your Ruby script files as using the partial assembly name can cause 
                    problems. However, for interactive exploration, using the partial assembly name is much
                    more easier. To use the full assembly name, you could have done:

                      load_assembly 'System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'

                    Now load the XML file 'load.xml' by creating an instance of +XmlDocument+.
                },
                :source_files => IronRubyTutorial.load_xml_path,
                :code => [
                    'd = XmlDocument.new', 
                    "d.load '#{IronRubyTutorial.load_xml_relative_path}'"]
                ) { |i| i.bind.d.get_elements_by_tag_name("Puzzle").count == 1 }

            task(:body => %{
                    We can now query the document. Use the statements below to get output like:

                        Seattle (default game)
                        New York
                        World
                        North America
                },
                :code => [
                    "n = d.select_nodes '//Puzzle/SavedGames/Game/@caption'", 
                    'n.each { |e| puts e.value }']
                ) { |i| /Seattle/ =~ i.output }
        end

        chapter "Loading .NET libraries from a given path" do
            introduction %{
                Coming_soon
            }

            task :body => %{
                    Coming_soon
                },
                :code => 'coming_soon=true'
        end
    end

    section "Advanced IronRuby - Events and delegates" do
        introduction %{
            The large part of the beauty of IronRuby lies within the dynamic-style development - modifying
            the live application by adding functioning elements to it. With Windows applications, this often 
            requires delegates and event handling (i.e., adding a button to an existing form and adding 
            functionality to the button to handle the user pressing the button).

            This tutorial will focus on creating delegates, handling events in IronPython, and creating
            Windows applications using Windows Forms and the new Windows Presentation Foundation.
        }
        
        chapter "File System watcher" do

            task(:body => %{
                    Import the contents of <tt>System::IO</tt> into the global namespace, and create an 
                    instance of the +FileSystemWatcher+ class.
                },
                :code => [
                    'include System::IO', 
                    'w = FileSystemWatcher.new']
                ) { |i| i.bind.w.class == System::IO::FileSystemWatcher }

            task(:body => %{
                    Inspect the methods available on the instance, and then set the +path+ property to watch
                    over the current directory.
                },
                :code => [
                    'w.class.instance_methods false', 
                    "w.path = '.'"]
                ) { |i| i.bind.w.path == '.' }

            task(:body => %{
                    Register a block as an event handler for the +changed+, +created+, and +deleted+ events. 
                    Because we don't know yet what arguments the block will have, let's accept any number of 
                    arguments (the <tt>*a</tt> notation).
                },
                :setup => Proc.new { |bind| IronRubyTutorial.snoop_add_handler "deleted", bind.w },
                :code => [
                    'w.changed { |*a| puts a.inspect }', 
                    'w.created { |*a| puts a.inspect }', 
                    'w.deleted { |*a| puts a.inspect }']
                ) { IronRubyTutorial.deleted_flag }

            task(:body => %{
                    Enable the watcher to raise events.
                },
                :code => 'w.enable_raising_events = true'
                ) { |i| i.bind.w.enable_raising_events }

            task(:body => %{
                    Now open the Tutorial folder and create a file. An 
                    easy way to create the file is to right-click with the mouse and select "New\Text Document". 
                    The file watcher will raise the +created+ event. You can then open the file in Notepad, 
                    type in any text, and save the file. This raises the +changed+ event. Then finish by 
                    deleting the file to see the +deleted+ event get raised.

                    At the end of this step, the output in the command window will be similar to the following:

                        [System.IO.FileSystemWatcher, System.IO.FileSystemEventArgs]
                        [System.IO.FileSystemWatcher, System.IO.FileSystemEventArgs]
                        [System.IO.FileSystemWatcher, System.IO.FileSystemEventArgs]
                        [System.IO.FileSystemWatcher, System.IO.FileSystemEventArgs]
                    
                    Finally disable the watcher.
                },
                :code => 'w.enable_raising_events = false'
                ) { |i| not i.bind.w.enable_raising_events }
        end

        chapter "Improving the event handler" do

            task :body => %{
                    In the previous task, we can see that the types of the parameters passed to all three 
                    events were the same:
                    
                    * +FileSystemWatcher+ : the instance of the object that raised the event
                    * +FileSystemEventArgs+ : the information about the event raised

                    Use +instance_methods+ to explore the event arguments class to find what information 
                    the event contains.
                },
                :setup => Proc.new { |bind|
                    include System::IO
                    eval %{
                        w = FileSystemWatcher.new unless defined? w and w.class == FileSystemWatcher
                    }, bind
                },
                :code => 'FileSystemEventArgs.instance_methods(false)'

            task(:body => %{
                    Now with more knowledge of the event argument properties, we can create a better event 
                    handler that will print +change_type+ and +full_path+ properties of the event argument 
                    object.
                },
                :setup => Proc.new { |bind| IronRubyTutorial.snoop_add_handler "deleted", bind.w },
                :code => [
                    'w.changed { |w1,a| puts a.change_type, a.full_path }',
                    'w.created { |w1,a| puts a.change_type, a.full_path }',
                    'w.deleted { |w1,a| puts a.change_type, a.full_path }']
                ) { IronRubyTutorial.deleted_flag }

            task(:body => %{
                    Make sure the raising of the events is enabled:
                },
                :code => 'w.enable_raising_events = true'
                ) { |i| i.bind.w.enable_raising_events }

            task(:body => %{
                    Finally disable the watcher.
                },
                :code => 'w.enable_raising_events = false'
                ) { |i| not i.bind.w.enable_raising_events }
        end

    end

    section "Advanced IronRuby - Windows Forms" do

        introduction %{
            Note that if you develop Windows applications interactively using <tt>ir.exe</tt> or +iirb+ from
            the <b>Command Prompt</b> console, IronRuby must be initialized specially for that purpose. <tt>ir.exe</tt>
            blocks the main thread so that it can read user input. While this thread awaits text input, the 
            Windows application being dynamically created from the console needs to run on a separate thread
            so that it can process Windows messages. Further, WPF requires that all commands that interact
            with UI controls need to be executed on the message pump thread. <tt>wpf.rb</tt> includes a helper 
            method to deal with this. If you are using a _console_ interactive session, do the following:
            
                require "wpf.rb"
                Wpf.interact
        }
                
        chapter "Creating a simple Form" do
            introduction %{
                In this exercise, you will create simple Windows Forms applications dynamically.
            }

            task :body => %{
                    First, we need to load <tt>System.Windows.Forms.dll</tt>. Note that it is recommended to
                    use the full assembly name in larger programs as such:
                    
                        load_assembly "System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
                    
                    However, for interactive use, we will use the short form.
                },
                :code => "load_assembly 'System.Windows.Forms'"

            task :body => %{
                    Import the contents of the <tt>System::Windows::Forms</tt> namespaces into the global 
                    namespace.
                },
                :code => 'include System::Windows::Forms'

            task(:body => %{
                    Create an instance of the Form class and display it.
                },
                :code => ['f = Form.new', 'f.show']
                ) { |i| i.bind.f.visible }

            task(:body => %{
                    You may need to alt-tab or look for the running application since it may not have popped
                    to the top level on your desktop.
                    
                    Now set the form Text property.
                },
                :setup => Proc.new {
                    # TODO - Position the form so that it is not hidden behind the current window
                },
                :code => "f.text = 'Hello'"
                ) { |i| /hello/i =~ i.bind.f.text }
        end
        
        chapter "Adding event handlers to the Form" do
            task(:body => %{
                    To bring the application alive, let's focus on the +click+ event of the form. Create an 
                    event handler for the +click+ event and click on the form to receive the event. 
                },
                :setup => Proc.new { |bind|
                    load_assembly 'System.Windows.Forms'
                    include System::Windows::Forms
                    eval %{
                        f = Form.new unless defined? f and f.class == Form
                        f.show
                    }, bind

                    IronRubyTutorial.snoop_add_handler "click", bind.f
                },
                :code => 'f.click { |*args| puts args }'
                ) { IronRubyTutorial.click_flag }

            task :body => %{
                    Now click the form. You should see output printed in the REPL window, looking something
                    like this:
                    
                      System.Windows.Forms.Form, Text: Hello
                      System.Windows.Forms.MouseEventArgs
                      
                    You can inspect +MouseEventArgs+ using the +instance_methods+ method.
                },
                :code => 'MouseEventArgs.instance_methods(false)'

            task(:body => %{
                    Knowing the contents of the MouseEventArgs, create an improved event handler for the
                    +click+ event using the +location+ property.
                },
                :code => %{
                    def on_click(f, a)
                        l = Label.new
                        l.text = 'Hello'
                        l.location = a.location
                        f.controls.add l
                    end}.strip_margin
                ) do |i|
                    f = Tutorial.stub
                    a = Tutorial.stub
                    # "l.location = a.location" is expected to fail because "a.location" currently just returns a Stub
                    i.bind.on_click(f, a) rescue TypeError
                    a.called? :location
                end

            task(:body => %{
                    Now add the method as a +click+ handler
                },
                :setup => Proc.new { |bind| IronRubyTutorial.snoop_add_handler "click", bind.f },
                :code => 'f.click { |f, a| on_click(f, a) }'
                ) { IronRubyTutorial.click_flag }

            task :body => %{
                    Now clicking on the form with the mouse will add 'Hello' labels. We can also access the 
                    controls we just added via mouse clicks and change them
                },
                :code => "f.controls.each { |i| i.Text = 'Hi' }"

            task(:body => %{
                    After a few moments of clicking, the form will get quite crowded, so we can clear it out.
                    Also, don't forget to close the form.
                },
                :code => [
                    'f.controls.clear', 
                    'f.close']
                ) { |i| not i.bind.f.visible }
        end

    end

    section "Advanced IronRuby - Windows Presentation Foundation" do
        introduction %{
            Windows Presentation Foundation is a new UI framework with rich support for media (3D, video, etc)
            data-binding, and customization.
        }
        
        chapter "Simple WPF application" do
            introduction %{
                In this exercise, you will interactively create simple interactive Windows Presentation 
                Foundation application
            }

            task(:body => %{
                    It is useful to have common initialization code while using Windows Presentation Foundation
                    in interactive development. This is available in the +Wpf+ module in the <tt>wpf.rb</tt> file.
                },
                :source_files => IronRubyTutorial.wpf_path,
                :code => "require 'wpf.rb'"
                ) { |i| [false, true].include? i.result }

            task(:body => %{
                    To make all the WPF class names directly available, you could do:
                    
                        include Wpf
                    
                    However, this adds a lot of classes to the global namespace which can cause conflicts.
                    For example, <tt>System::Collections::Generic::List</tt> and
                    <tt>System::Windows::Documents::List</tt>. For this reason, it is preferable to
                    use scope access like <tt>Wpf::List</tt> instead of doing <tt>include Wpf</tt>.
                    
                    Now let's create a window.
                },
                :code => [
                    'w = Wpf::Window.new', 
                    'w.show']
                ) { |i| i.bind.w.visibility == System::Windows::Visibility.visible }

            task(:body => %{
                    You may need to alt-tab or look for the running application since it may not have popped 
                    to the top level on your desktop.
                    
                    Now, let's do more. We will set the window property to "size to content", which should
                    cause the window to shrink. We can also set the title.
                },
                :code => [
                    'w.size_to_content = Wpf::SizeToContent.width_and_height', 
                    "w.title = 'Hello'"]
                ) { |i| String.new(i.bind.w.title) =~ /Hello/i } # TODO - String.new should not be needed here

            task(:body => %{
                    Let's add the content now
                },
                :code => [
                    'w.content = Wpf::TextBlock.new',
                    'w.content.text = "Hello IronRuby!"',
                    'w.content.font_size = 50']
                ) { |i| i.bind.w.content.font_size == 50 }

            task(:body => %{
                    You can close the window like this"
                    
                        w.close
                    
                    However, we will just clear out the content so that we can use the same window in the
                    next chapter.
                },
                :code => 'w.content = nil'
                ) { |i| not i.bind.w.content }
        end

        chapter "WPF calculator" do
            task(:body => %{
                    Windows Presentation Foundation uses the XAML format to describe the graphical layout 
                    and basic behaviors of UI. Load the "calc.xaml" file and display the resulting content.
                },
                :setup => Proc.new { |bind|
                    require 'wpf.rb'
                    eval %{
                        w = Wpf::Window.new unless defined? w and w.class == Wpf::Window
                        w.size_to_content = Wpf::SizeToContent.width_and_height
                        w.content = nil
                        w.show
                    }, bind
                },
                :source_files => IronRubyTutorial.calc_xaml_path,
                :code => "w.content = Wpf.load_xaml_file '#{IronRubyTutorial.calc_xaml_relative_path}'"
                ) { |i| i.bind.w.content }

            task(:body => %{
                    Let's walk the calculator's object model using the +walk+ method defined in the "wpf.rb" 
                    file.
                },
                :code => 'Wpf.walk(w) { |c| puts c }'
                ) { |i| i.output =~ /Button: \+/ }

            task :body => %{
                    Let's filter the results to button only
                },
                :code => 'buttons = Wpf.walk(w).select { |c| c.kind_of? Wpf::Button }'

            task(:body => %{
                    At this point we can make changes to all the buttons, for example, change the colors and 
                    fonts
                },
                :code => [
                    'buttons.each { |b| b.font_size *= 2 }',
                    'buttons.each { |b| b.foreground = Wpf::SolidColorBrush.new(Wpf::Colors.blue) }']
                ) { |i| i.bind.buttons.first.foreground.to_s == '#FF0000FF' }

            task :body => %{
                    If you use "wpf.rb", you can also access the controls by the name specified in the XAML
                    file. However, this works only when you use the object created by +load_xaml_file+.
                    So <tt>w.Result</tt> will not work, but <tt>w.content.Result</tt> will
                },
                :code => 'w.content.Result'

            task(:body => %{
                    Let's define an event handler for the buttons.
                },
                :setup => Proc.new { |bind| eval "on_click = '(undefined)'", bind },
                :code => %{
                    def on_click(c, text)
                        if text == 'C' then 
                            c.Result.text = ""
                        elsif text == '='
                            c.Result.text = eval(c.Result.text.to_s).to_s rescue "(error)"
                        else 
                            c.Result.text = c.Result.text + text
                        end
                    end}.strip_margin
                ) { |i| i.bind.on_click(Tutorial.stub, '=') == '' }

            task(:body => %{
                    Let's hook up the event handler
                },
                :setup => Proc.new { |bind| IronRubyTutorial.snoop_add_handler "click", bind.buttons.first },
                :code => 'buttons.each { |b| b.click { on_click w.content, b.content } }'
                ) { |i| IronRubyTutorial.click_flag }

            task(:body => %{
                    Now you should be able to use the calculator!
                    
                    When you are done, close the calculator window.
                },
                :code => 'w.close'
                ) { |i| not i.bind.w.is_visible }
        end
    end

    section "COM Interoperability - Using Microsoft Word" do
        introduction %{
            Coming_soon
        }
        
        chapter "Checking spelling" do
            introduction %{
                Coming_soon
            }

            task :body => %{
                    Coming_soon
                },
                :code => 'coming_soon=true'
        end

        chapter "Use Windows Form Dialog to Correct Spelling" do
            introduction %{
                Coming_soon
            }

            task :body => %{
                    Coming_soon
                },
                :code => 'coming_soon=true'
        end

    end

    section "COM Interoperability - Using Microsoft Excel" do
        introduction %{
            Coming_soon
        }
        
        chapter "Coming_soon" do
            introduction %{
                Coming_soon
            }

            task :body => %{
                    Coming_soon
                },
                :code => 'coming_soon=true'
        end
    end

   
    summary %{
        Congratulations! You have completed the IronRuby tutorial. 
           
        For more information about IronRuby, please visit http://ironruby.net.
    }
end

