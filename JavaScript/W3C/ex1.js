
var o = { x: 1, y: 2};          // 定义一个对象
console.log(delete o.x);        // true，删除一个属性
console.log(o)
console.log(delete o.x);        // true，什么都没做，x 在已上一步被删除
console.log("x" in o);          // false，这个属性在对象中不再存在
console.log(delete o.toString); // true，什么也没做，toString是继承来的
console.log(delete 1);          // true，无意义

var a = ["x","y","z"];          // 定义一个数组
console.log(2 in a);            // true，下标为2的元素，在数组中存在
console.log(delete a[2]);       // true，删除下标为2的元素（最后一个数组元素）
console.log(2 in a);            // false，下标为2的元素，在数组中不再存在
console.log(a.length);          // 3，数组长度并不会因 delete 而改变
console.log(a[2]);              // undefined，下标为2的元素，位置被空了出来
console.log(delete a);          // false，通过 var 语句声明的变量不能删除

function f(args){}              // 定义一个函数
console.log(delete f);          // false，通过 function 语句声明的函数不能删除


var a = 5
console.log(a++);   // 5
console.log(++a);   // 7
console.log(a--);   // 7
console.log(--a);   // 5
