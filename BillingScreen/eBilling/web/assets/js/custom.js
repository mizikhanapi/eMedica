/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function($) {
    var path = window.location.pathname;
    $('#cssmenu ul li a[href="' + path + '"]').parent().addClass('active');
});

