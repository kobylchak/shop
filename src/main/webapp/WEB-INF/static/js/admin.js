$('.dropdown-toggle').dropdown();
$('#add_mobile').click(function () {
    window.location.href = '/mobile/page';
});

$('#add_brand').click(function () {
    window.location.href = '/brand';
});
$('#delete_mobile').click(function () {
    var data = {'toDo[]': []};
    $(":checked").each(function () {
        data['toDo[]'].push($(this).val());
    });
    $.post("/mobile/delete", data, function (data, status) {
        window.location.reload();
    });
});
$('#delete_photo').click(function () {
    var data = {'toDeletePhoto[]': []};
    $(":checked").each(function () {
        data['toDeletePhoto[]'].push($(this).val());
    });
    $.post("/photo/delete", data, function (data, status) {
        window.location.reload();
    });
});
$('#change_price').click(function () {
    var newPrice = document.getElementById("newPrice").value;
    var data = {newPrice: newPrice, 'toDo[]': []};
    $(":checked").each(function () {
        data['toDo[]'].push($(this).val());
    });
    $.post("/mobile/change_price", data, function (data, status) {
        window.location.reload();
    });
});
$('#change_discount').click(function () {
    var newDiscount = document.getElementById("newDiscount").value;
    var data = {newDiscount: newDiscount, 'toDo[]': []};
    $(":checked").each(function () {
        data['toDo[]'].push($(this).val());
    });
    $.post("/mobile/change_discount", data, function (data, status) {
        window.location.reload();
    });
});
$('#find_users').click(function () {
    window.location.href = '/users';
});