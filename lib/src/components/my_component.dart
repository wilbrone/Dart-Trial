import 'dart:async';

part of bootstrap.ui.tabs;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';


@Component(
  selector: 'my-app',
  styleUrls: const ['my_component.css'],
  templateUrl: 'my_component.html',
  directives: const [
    CORE_DIRECTIVES,
  ],
  providers: const [],
  visibility: NgDirective.CHILDREN_VISIBILITY,
)
class MyComponent implements OnInit {


   final MyComponent tabsetCtrl;
   final Element element;
   var heading;
   var onSelectCallback;
   var onDeselectCallback;
   bool _active = false;
   bool disabled = false;

   TabComponent(this.element, this.tabsetCtrl, Scope scope) {
     this.tabsetCtrl.addTab(this);
   }

   get active => _active;

   set active(var newValue) {
     if (newValue!=null && newValue==true) {
       tabsetCtrl.select(this);
     }
   }

   set select(bool newValue) {
     if (newValue) {
       if(onSelectCallback!=null) {
         onSelectCallback();
       }
     } else {
       if(_active && onDeselectCallback!=null) {
         onDeselectCallback();
       }
     }
     _active = newValue;
   }

   void detach() {
     this.tabsetCtrl.removeTab(this);
  }



  Future<Null> ngOnInit() async {
  }
}
