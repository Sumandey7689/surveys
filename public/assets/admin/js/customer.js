$(function () {
    var base_url = $("#base_url").val();
    loadCustomerList();
    var Toast = Swal.mixin({
		toast: true,
		position: "top-end",
		showConfirmButton: false,
		timer: 500,
	});
 

    // Show the spinner
   

    // $(document).on("click", ".customerstatus", function (event) {
    //     event.preventDefault();
    //     event.stopImmediatePropagation();
    //     var uid = $(this).attr("id");
    //     var status = $(this).data("setstatus");
    //     $.ajax({
    //         url: base_url + "/admin/customer/status",
    //         dataType: 'json',
    //         type: 'post',
    //         data: { uid: uid, status: status },
    //         success: function (result) {
    //             if (result.status == 1) {
    //                 loadCustomerList();
    //             }

    //             Toast.fire({
    //                 type: 'success',
    //                 title: result.msg_data
    //             })
    //         }
    //     });

    // });

    $(document).on("click", ".customerstatus", function (event) {
        event.preventDefault();
        event.stopImmediatePropagation();
        var uid = $(this).attr("id");
        var status = $(this).data("setstatus");
      
        

        Swal.fire({
            title: 'Are you sure?',
            text: "Do you really want to change the status?",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes',
            cancelButtonText: 'No'
        }).then((result) => {
            if (result.value) {
                $(this).hide();
               
                $('#prosess_'+uid).css("display", "block");
               
                $.ajax({
                    url: base_url + "/admin/customer/status",
                    dataType: 'json',
                    type: 'post',
                    data: { uid: uid, status: status },
                    success: function (result) {
                        if (result.status == 1) {
                            loadCustomerList();
                        }

                        Swal.fire({
                            icon: 'success',
                            title: 'Success!',
                            text: result.msg_data,
                            timer: 1500,
                            showConfirmButton: false
                        });
                    },
                    error: function (xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'An error occurred while changing the status.',
                            timer: 1500,
                            showConfirmButton: false
                        });
                    }
                });
            }
        });
    });

});  

function loadCustomerList() {
    $("#customer_data").html("");
    $("#loader").show();

    var base_url = $("#base_url").val();
    $.ajax({
        type: "POST",
        url: base_url + "/admin/customer/getcustomerpartialview",
        datatype: "html",
        data: {
            userid: "",
        },
        success: function (response) {
            $("#loader").hide();
            $("#customer_data").html(response);
             $(".dataTable").DataTable();

            
        },
        error: function (xhr) {
            console.log(xhr.responseText);
            var errors = xhr.responseJSON.errors;
            if (errors) {
                $.each(errors, function (field, messages) {
                    var errorHtml = '<ul class="list-unstyled">';
                    $.each(messages, function (index, message) {
                        errorHtml += "<li>" + message + "</li>";
                    });
                    errorHtml += "</ul>";
                    $("#my-form")
                        .find('[name="' + field + '"]')
                        .after(errorHtml);
                });
            }
        },
    });
}