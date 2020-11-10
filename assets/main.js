(function ($) {
    'use strict';

    var browserWindow = $(window);
    var document = $(document);
    var baseUrl = 'http://localhost/teste_washington_bernoulli/';

    $( document ).ready(function() {
        loadTable();
    });

    function loadTable()
    {
        $.ajax({
            url : baseUrl+"ajax/getDataTable",
            headers: {'X-Requested-With': 'XMLHttpRequest'},
            type: "get",
            dataType:"json",
            beforeSend : function(){
                loading(true);
            },
            success: function (data) {
                var reg = '';
                for (let i = 0; i < data.length; i++) {
                    reg += "<tr>";
                    reg += "<td>"+(i+1)+"</td>"
                    reg += "<td class='icon "+data[i].picture+"'><a href='confrontation/"+data[i].id+"'>"+data[i].name+"</a></td>"
                    reg += "<td>"+data[i].score+"</td>"
                    reg += "<td>"+data[i].jogos+"</td>";
                    reg += "<td>"+data[i].victory+"</td>";
                    reg += "<td>"+data[i].equal+"</td>";
                    reg += "<td>"+data[i].defeat+"</td>";
                    reg += "<td>"+data[i].GF+"</td>";
                    reg += "<td>"+data[i].GC+"</td>";
                    reg += "<td>"+data[i].SG+"</td>";
                    reg += "</tr>";
                }
                $(".tabela table tbody").html(reg);
                
                optionsConfrontation(data);
                historyConfrontation();
                loading(false);
            }
        })
    }

    function optionsConfrontation(data)
    {
            var options = '';
            for (let i = 0; i < data.length; i++) {
                options += "<option value='"+data[i].id+"'>"+data[i].name+"</option>"
            }
            $(".modal#modalInsertConfrontation form select#home").html(options);
            $(".modal#modalInsertConfrontation form select#visitor").html(options);
            $("#formInsertConfrontation input:not([disabled])").val('');
            $("#formInsertConfrontation select").val('');
            
            $(".modal#modalInsertConfrontation form select").change(function(){
                checkSelectedOptionsConfrontation();
            });
    }

    function checkSelectedOptionsConfrontation()
    {
        let time_mandante = $(".modal#modalInsertConfrontation form select#home");
        let time_visitante = $(".modal#modalInsertConfrontation form select#visitor");
       
        if (time_mandante.val() == time_visitante.val())
        {
            time_mandante.addClass('is-invalid');
            time_visitante.addClass('is-invalid');
            return false;
        }
        else
        {
            time_mandante.removeClass('is-invalid');
            time_visitante.removeClass('is-invalid');
            return true;
        }
    }

    function loading( show = true )
    {
        if (show)
        {
            $("div.loading").addClass('show');
        }
        else
        {
            $("div.loading").removeClass('show');
        }
    }

    function alert( success = true, message = 'sadad')
    {
        if (success)
        {
            toastr.success(message, { timeOut: 20000 });
        }
        else
        {
            toastr.error(message, { timeOut: 20000 });
        }
    }

    function historyConfrontation()
    {
        $( ".tabela table tbody tr td" ).on('click','a', function( event )
        {
            event.preventDefault();
            $.ajax({
                type: "get",
                url : $( this ).attr('href'),
                dataType:"json",
                success: function (response) {
                    if(response.data.length > 0) {
                        var reg = '';
                        for (let i = 0; i < response.data.length; i++) {
                            reg += "<li>";
                            reg += "<img src='assets/icons/"+response.data[i].picture_home+".png' class='svg-time'>";
                            reg += "<span>"+response.data[i].score_home+"</span>";
                            reg += "x";
                            reg += "<span>"+response.data[i].score_visitor+"</span>";
                            reg += "<img src='assets/icons/"+response.data[i].picture_visitor+".png' class='svg-time'>";
                            reg += "</li>";
                        }
                        $(".confrontos ul").html(reg);
                        $(".confrontos").addClass('show');
                    } else {
                        alert(false,'Não há confrontos para esse time.');
                    }
                }
            })
            // return false;        
        });

        $( ".confrontos .close" ).on('click', function( event )
        {
            $(".confrontos").removeClass('show');
        });
    }

    $( "form#formInsertConfrontation" ).submit(function( event )
    {
        event.preventDefault();

        if (!checkSelectedOptionsConfrontation())
            return;

        var dataString = $("#formInsertConfrontation").serialize();
        $.ajax({
            type: "post",
            url : baseUrl+"confrontation",
            dataType:"json",
            data: dataString,
            success: function (response) {
                $('#modalInsertConfrontation').modal('hide');
                if(response.success) {
                    alert(true, response.message);
                } else if(response.success) {
                    alert(false, response.message);
                }
                $("#formInsertConfrontation input").val('');
                $("#formInsertConfrontation select").val('');
                loadTable();
            }
        })
        // return false;        
    });

})(jQuery);