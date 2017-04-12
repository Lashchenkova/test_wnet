$(function() {
    $("#ajaxform").submit(function() {
        var formData = $('#ajaxform').serialize();

        $.ajax({
            url:'index.php',
            type:'GET',
            data : formData,
            success: function(res) {
                jQuery('#ajaxform')[0].reset();
                res = JSON.parse(res);
                var services = '';
                var result = $('.results');

                if(!res.length){
                    result.html('нет такого клиента');
                    return;
                }

                for (var i = 1; i <= res.length - 1; i++) {
                    services += res[i].title_service + ": " + res[i].status + "<br>";
                }
                if(!services){
                    services = "сервисов нет";
                }

               result.load('view.html', function() {
                    $('td:contains("[name_customer]")').text(res[0].name_customer);
                    $('td:contains("[ company]")').text(res[0].company);
                    $('td:contains("[ number]")').text(res[0].number);
                    $('td:contains("[ date_sign]")').text(res[0].date_sign);
                    $('td:contains("[services_name]")').html(services);
                });
            }
        });
        return false;
    });
});