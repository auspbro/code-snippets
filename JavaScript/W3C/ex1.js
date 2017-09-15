// 'use strict';

var o = { x: 1, y: 2 };          // 定义一个对象
console.log(delete o.x);        // true，删除一个属性
console.log(o)
console.log(delete o.x);        // true，什么都没做，x 在已上一步被删除
console.log("x" in o);          // false，这个属性在对象中不再存在
console.log(delete o.toString); // true，什么也没做，toString是继承来的
console.log(delete 1);          // true，无意义

var a = ["x", "y", "z"];          // 定义一个数组
console.log(2 in a);            // true，下标为2的元素，在数组中存在
console.log(delete a[2]);       // true，删除下标为2的元素（最后一个数组元素）
console.log(2 in a);            // false，下标为2的元素，在数组中不再存在
console.log(a.length);          // 3，数组长度并不会因 delete 而改变
console.log(a[2]);              // undefined，下标为2的元素，位置被空了出来
console.log(delete a);          // false，通过 var 语句声明的变量不能删除

function f(args) { }              // 定义一个函数
console.log(delete f);          // false，通过 function 语句声明的函数不能删除


var a = 5
console.log(a++);   // 5
console.log(++a);   // 7
console.log(a--);   // 7
console.log(--a);   // 5

// var age = 20
// if (age >= 18) {
//     alert('adult') 
// } else {
//     alert('teenager')
// }

// var age = 20
// if (age >= 18) {
//     alert('adult') 
// } else {
//     console.log('age < 18')
//     alert('teenager')
// }

// var age = 3
// if (age >= 18) {
//     alert('adult')
// } else if (age >= 6) {
//     alert('teenager')
// } else {
//     alert('kid')
// }

// var age = 3
// if (age >= 18) {
//     alert('adult')
// } else {
//     if (age >= 6) {
//         alert('teenager')
//     } else {
//         alert('kid')
//     }
// }

// ------------------ if else----------------------------------
// var height = parseFloat(prompt('请输入身高(m):'))
// var weight = parseFloat(prompt('请输入体重(kg):'))
// var bmi = weight / (height * height)
// console.log(bmi)

// if (bmi > 32) {
//     alert('very fat')
// } else if (bmi > 28 && bmi < 32){
//     alert('fat')
// } else if (bmi > 25 && bmi < 28) {
//     alert('overweight')
// } else if (bmi > 18.5 && bmi < 25) {
//     alert('normal')
// } else {
//     alert('thin')
// }


// -------------- for loop ----------------
var x = 1
for (var i = 1; i <= 10; i++) {
    x *= i
}

console.log(x)

if (x === 3628800) {
    alert('1 * 2 * 3 * ...*10 = ' + x)
} else {
    alert('计算错误！！')
}

// -------------- for loop 利用索引遍历数组 ------
var arr = ['Apple', 'Google', 'Microsoft','Amzon']
for (var index = 0; index < arr.length; index++) {
    var element = arr[index];
    element = arr[index]
    alert(element)
}