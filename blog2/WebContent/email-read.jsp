

<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from demo.quixkit.com/corbin/email-read.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:03 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Talkdove</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="css/style.css" rel="stylesheet">
    
</head>

<body>
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader"><div class="spinner"><div class="spinner-a"></div><div class="spinner-b"></div></div></div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="index.html" class="brand-logo">
                <span class="logo-abbr">Q</span>
                <span class="logo-compact">Corbin</span>
                <span class="brand-title">Corbin</span>
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="toggle-icon"><i class="icon-menu"></i></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header"> 
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon d-md-none p-3 c-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-search"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form class="form-inline">
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                                    </form>
                                </div>
                            </div>
                        </div>
                    
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="mdi mdi-bell"></i>
                                    <span class="badge badge-primary">3</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <h5 class="notification_title">Notifications</h5>
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <img class="mr-3" src="images/avatar/1.jpg" alt="Quixlab">
                                            <div class="media-body">
                                                <a href="#">
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Mr John</h5>
                                                    </div>
                                                    <p class="m-0">signed nup now</p>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="media dropdown-item">
                                            <img class="mr-3" src="images/avatar/8.jpg" alt="Quixlab">
                                            <div class="media-body">
                                                <a href="#">
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Lisa Heiden</h5>
                                                    </div>
                                                    <p class="m-0">Reset password</p>
                                                </a>
                                            </div>
                                        </li>
                                        <li class="media dropdown-item">
                                            <img class="mr-3" src="images/avatar/2.jpg" alt="Quixlab">
                                            <div class="media-body">
                                                <a href="#">
                                                    <div class="d-flex justify-content-between">
                                                        <h5>Mr khan</h5>
                                                    </div>
                                                    <p class="m-0">Email sent</p>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">All Notifications</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>My profile</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Calender</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Inbox</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Settings</span>
                                    </a>
                                    <a href="#!" class="dropdown-item">
                                        
                                        <span>Logout</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="quixnav">           
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">Navigation</li>
                    <li><a href="index.html"><i class="mdi mdi-home"></i><span class="nav-text">Home</span></a></li>
                    
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-apps"></i><span class="nav-text">Apps</span></a>
                        <ul aria-expanded="false">
                            <li><a href="email-compose.html">Compose</a></li>
                            <li><a href="email-read.html">Read</a></li>
                            <li><a href="email-inbox.html">Inbox</a></li>
                            <li><a href="app-calender.html">Calendar</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-chart-areaspline"></i><span class="nav-text">Charts</span></a>
                        <ul aria-expanded="false">
                            <li><a href="chart-chartjs.html">Chartjs</a></li>
                            <li><a href="chart-morris.html">Morris</a></li>
                            <li><a href="chart-flot.html">Flot</a></li>
                            <li><a href="chart-amchart.html">AmChart</a></li>
                            <li><a href="chart-chartist.html">Chartist</a></li>
                            <li><a href="chart-peity.html">Peity</a></li>
                            <li><a href="chart-sparkline.html">Sparkline</a></li>
                            <li><a href="chart-pie.html">Pie</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-bootstrap"></i><span class="nav-text">UI</span></a>
                        <ul aria-expanded="false">
                            <li><a href="ui-alert.html">Alert</a></li>
                            <li><a href="ui-accordion.html">Accordion</a></li>
                            <li><a href="ui-button.html">Button</a></li>
                            <li><a href="ui-button-group.html">Button Group</a></li>
                            <li><a href="ui-badge.html">Badge</a></li>
                            <li><a href="ui-card.html">Card</a></li>
                            <li><a href="ui-grid.html">Grid</a></li>
                            <li><a href="ui-label.html">Label</a></li>
                            <li><a href="ui-list-group.html">List Group</a></li>
                            <li><a href="ui-media-object.html">Media Object</a></li>
                            <li><a href="ui-modal.html">Modal</a></li>
                            <li><a href="ui-pagination.html">Pagination</a></li>
                            <li><a href="ui-popover.html">Popover</a></li>
                            <li><a href="ui-progressbar.html">Progressbar</a></li>
                            <li><a href="ui-tab.html">Tab</a></li>
                            <li><a href="ui-tooltip.html">Tooltip</a></li>
                            <li><a href="ui-typography.html">Typography</a></li>
                        </ul>
                    </li>
                    
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-power-plug"></i><span class="nav-text">Advanced</span></a>
                        <ul aria-expanded="false">
                            <li><a href="uc-counter.html">Counter</a></li>
                            <li><a href="uc-clipboard.html">Clipboard</a></li>
                            <li><a href="uc-nestable.html">Nestable</a></li>
                            <li><a href="uc-bs-select.html">BS Select</a></li>
                            <li><a href="uc-blockui.html">Block UI</a></li>
                            <li><a href="uc-uislider.html">UI Slider</a></li>
                            <li><a href="uc-toastr.html">Toastr</a></li>
                            <li><a href="uc-sweet-alert.html">Sweet Alert</a></li>
                            <li><a href="uc-bs-notify.html">BS notify</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-map-marker"></i><span class="nav-text">Map</span></a>
                        <ul aria-expanded="false">
                            <li><a href="map-datamap.html">Datamap</a></li>
                            <li><a href="map-jqvmap.html">JQV Map</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-file-document-box"></i><span class="nav-text">Forms</span></a>
                        <ul aria-expanded="false">
                            <li><a href="form-element.html">Element</a></li>
                            <li><a href="form-layout.html">Layout</a></li>
                            <li><a href="form-validation.html">Validation</a></li>
                            <li><a href="form-wizard.html">Wizard</a></li>
                            <li><a href="form-drofify.html">Drofify</a></li>
                            <li><a href="form-typehead.html">Typehead</a></li>
                            <li><a href="form-taginput.html">Tag Input</a></li>
                            <li><a href="form-selext2.html">Select2</a></li>
                            <li><a href="form-switchery.html">Switchery</a></li>
                            <li><a href="form-touch-spinner.html">Touch Spinner</a></li>
                            <li><a href="form-xeditable.html">X-Editable</a></li>
                            <li><a href="form-summernote.html">Summernote</a></li>
                            <li><a href="form-pickers.html">Pickers</a></li>
                        </ul>
                    </li>

                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-table"></i><span class="nav-text">Table</span></a>
                        <ul aria-expanded="false">
                            <li><a href="table-bootstrap.html">Bootstrap</a></li>
                            <li><a href="table-foo.html">Foo</a></li>
                            <li><a href="table-bootgrid.html">Bootgrid</a></li>
                            <li><a href="table-jsgrid.html">Jsgrid</a></li>
                            <li><a href="table-datatable.html">Datatable</a></li>
                        </ul>
                    </li>
                    
                    <li><a href="widget-basic.html" aria-expanded="false"><i class="mdi mdi-widgets"></i><span class="nav-text">Widget</span></a></li>
                    
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="mdi mdi-earth"></i><span class="nav-text">Pages</span></a>
                        <ul aria-expanded="false">
                            <li><a href="page-login.html">Login</a></li>
                            <li><a href="page-register.html">Register</a></li>
                            <li><a href="page-user-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Erorr</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a href="page-error-400.html">Erorr 400</a></li>
                                    <li><a href="page-error-403.html">Erorr 403</a></li>
                                    <li><a href="page-error-404.html">Erorr 404</a></li>
                                    <li><a href="page-error-500.html">Erorr 500</a></li>
                                    <li><a href="page-error-503.html">Erorr 503</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
    
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="breadcrumb-range-picker">
                            <span><i class="icon-calender"></i></span>
                            <span class="ml-1">Email</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Email</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Read</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->                
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box generic-width px-0 mb-5">
                                    <div class="p-0">
                                        <a href="email-compose.html" class="btn btn-primary btn-block">Compose</a>
                                    </div>
                                    <div class="mail-list mt-4">
                                        <a href="email-inbox.html" class="list-group-item active"><i class="fa fa-inbox font-18 align-middle mr-2"></i> Inbox <span class="badge badge-primary badge-sm float-right">198</span> </a>
                                        <a href="javascript:void()" class="list-group-item"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>Sent</a>  <a href="javascript:void()" class="list-group-item"><i class="fa fa-star font-18 align-middle mr-2"></i>Important <span class="badge badge-danger badge-sm text-white float-right">47</span> </a>
                                        <a href="javascript:void()" class="list-group-item"><i class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>Draft</a><a href="javascript:void()" class="list-group-item"><i class="fa fa-trash font-18 align-middle mr-2"></i>Trash</a>
                                    </div>
                                    <div class="intro-title d-flex justify-content-between">
                                        <h5>Categories</h5>
                                        <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                    </div>
                                    <div class="mail-list mt-4">
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-warning"><i class="fa fa-circle" aria-hidden="true"></i></span>
                                            Work </a>
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-primary"><i class="fa fa-circle" aria-hidden="true"></i></span>
                                            Private </a>
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-success"><i class="fa fa-circle" aria-hidden="true"></i></span>
                                                Support </a>
                                        <a href="email-inbox.html" class="list-group-item"><span class="icon-dpink"><i class="fa fa-circle" aria-hidden="true"></i></span>
                                                Social </a>
                                    </div>
                                </div>
                                <div class="email-right-box bg-white ml-0 ml-sm-4 ml-sm-0">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="right-box-padding">
                                                <div class="toolbar" role="toolbar">
                                                <div class="btn-group mb-4">
                                                    <button type="button" class="btn btn-dark"><i class="fa fa-archive"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-dark"><i class="fa fa-exclamation-circle"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-dark"><i class="fa fa-trash"></i>
                                                    </button>
                                                </div>
                                                <div class="btn-group mb-4">
                                                    <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown"><i class="fa fa-folder"></i>  <b class="caret m-l-5"></b>
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="javascript: void(0);">Social</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Promotions</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Updates</a> 
                                                        <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                                    </div>
                                                </div>
                                                <div class="btn-group mb-4">
                                                    <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown"><i class="fa fa-tag"></i>  <b class="caret m-l-5"></b>
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="javascript: void(0);">Updates</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Social</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Promotions</a> 
                                                        <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                                    </div>
                                                </div>
                                                <div class="btn-group mb-4">
                                                    <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">More <span class="caret m-l-5"></span>
                                                    </button>
                                                    <div class="dropdown-menu">  
                                                        <a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Add Star</a>  
                                                        <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="read-content">
                                                <div class="media pt-3">
                                                    <img class="mr-4 rounded-circle" alt="image" src="images/guitar.jpg" width=50px; height=45px;>
                                                    <div class="media-body">
                                                        <h5 class="text-primary">Ingredia Nutrisha</h5>
                                                        <p class="mb-0">20 May 2018</p>
                                                    </div>
                                                    <a href="javascript:void()" class="text-muted "><i class="fa fa-reply"></i> </a>
                                                    <a href="javascript:void()" class="text-muted ml-3"><i class="fa fa-long-arrow-right"></i> </a>
                                                    <a href="javascript:void()" class="text-muted ml-3"><i class="fa fa-trash"></i></a>
                                                </div>
                                                <hr>
                                                <div class="media mb-4 mt-5">
                                                    <div class="media-body"><span class="pull-right">07:23 AM</span>
                                                        <h5 class="my-1 text-primary">A collection of textile samples lay spread</h5>
                                                        <p class="read-content-email">To:Me,invernessmckenzie@example.com</p>
                                                    </div>
                                                </div>
                                                <div class="read-content-body">
                                                    <h5 class="mb-5">Hi,Ingredia,</h5>
                                                    <p><strong>Ingredia Nutrisha,</strong> A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture</p>
                                                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of
                                                        Grammar. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.
                                                    </p>
                                                    <p>Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.
                                                        Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero,
                                                        sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar,</p>
                                                    <h5 class="pt-3">Kind Regards</h5>
                                                    <p>Mr Smith</p>
                                                    <hr>
                                                </div>
                                                <div class="read-content-attachment">
                                                    <h6><i class="fa fa-download mb-2"></i> Attachments <span>(3)</span></h6>
                                                    <div class="row attachment">
                                                        <div class="col-auto">
                                                            <a href="javascript:void()" class="text-muted">My-Photo.png</a>
                                                        </div>
                                                        <div class="col-auto">
                                                            <a href="javascript:void()" class="text-muted">My-File.docx</a>
                                                        </div>
                                                        <div class="col-auto">
                                                            <a href="javascript:void()" class="text-muted">My-Resume.pdf</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="form-group pt-3">
                                                    <textarea class="w-100" name="write-email" id="write-email" cols="30" rows="5" placeholder="It's really an amazing.I want to know more about it..!"></textarea>
                                                </div>
                                            </div>
                                            <div class="text-right">
                                                <button class="btn btn-primary btn-sl-sm mb-5" type="button">Send</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="https://themeforest.net/user/quixlab" target="_blank">Quixlab</a> 2019</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--removeIf(production)-->
        <!--**********************************
            Right sidebar start
        ***********************************-->
        <div class="sidebar-right">
            <a class="sidebar-right-trigger gradient-5" href="javascript:void(0)">
                <span><i class="fa fa-cog fa-spin"></i></span>
            </a>
            <div class="sidebar-right-inner">
                <!-- <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active show" data-toggle="tab" href="#home8">
                            <span><i class="icon-settings" aria-hidden="true"></i></span>
                        </a>
                    </li>
                </ul> -->

                <div class="tab-content tab-content-default tabcontent-border">
                    <div class="tab-pane fade active show" id="home8" role="tabpanel">
                        <div class="admin-settings">
                            <h4>Pick your style</h4>
                            <div>
                                <p>Navigation Header</p>
                                <div>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_1" class="filled-in chk-col-primary" id="nav_header_color_1">
                                        <label for="nav_header_color_1"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_2" class="filled-in chk-col-primary" id="nav_header_color_2">
                                        <label for="nav_header_color_2"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_3" class="filled-in chk-col-primary" id="nav_header_color_3">
                                        <label for="nav_header_color_3"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_4" class="filled-in chk-col-primary" id="nav_header_color_4">
                                        <label for="nav_header_color_4"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_5" class="filled-in chk-col-primary" id="nav_header_color_5">
                                        <label for="nav_header_color_5"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_6" class="filled-in chk-col-primary" id="nav_header_color_6">
                                        <label for="nav_header_color_6"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_7" class="filled-in chk-col-primary" id="nav_header_color_7">
                                        <label for="nav_header_color_7"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_8" class="filled-in chk-col-primary" id="nav_header_color_8">
                                        <label for="nav_header_color_8"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_9" class="filled-in chk-col-primary" id="nav_header_color_9">
                                        <label for="nav_header_color_9"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="navigation_header" value="color_10" class="filled-in chk-col-primary" id="nav_header_color_10">
                                        <label for="nav_header_color_10"></label>
                                    </span>
                                </div>
                            </div>
                            <div>
                                <p>Header</p>
                                <div>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_1" class="filled-in chk-col-primary" id="header_color_1">
                                        <label for="header_color_1"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_2" class="filled-in chk-col-primary" id="header_color_2">
                                        <label for="header_color_2"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_3" class="filled-in chk-col-primary" id="header_color_3">
                                        <label for="header_color_3"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_4" class="filled-in chk-col-primary" id="header_color_4">
                                        <label for="header_color_4"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_5" class="filled-in chk-col-primary" id="header_color_5">
                                        <label for="header_color_5"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_6" class="filled-in chk-col-primary" id="header_color_6">
                                        <label for="header_color_6"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_7" class="filled-in chk-col-primary" id="header_color_7">
                                        <label for="header_color_7"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_8" class="filled-in chk-col-primary" id="header_color_8">
                                        <label for="header_color_8"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_9" class="filled-in chk-col-primary" id="header_color_9">
                                        <label for="header_color_9"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="header_bg" value="color_10" class="filled-in chk-col-primary" id="header_color_10">
                                        <label for="header_color_10"></label>
                                    </span>
                                </div>
                            </div>
                            <div>
                                <p>Sidebar</p>
                                <div>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_1" class="filled-in chk-col-primary" id="sidebar_color_1">
                                        <label for="sidebar_color_1"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_2" class="filled-in chk-col-primary" id="sidebar_color_2">
                                        <label for="sidebar_color_2"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_3" class="filled-in chk-col-primary" id="sidebar_color_3">
                                        <label for="sidebar_color_3"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_4" class="filled-in chk-col-primary" id="sidebar_color_4">
                                        <label for="sidebar_color_4"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_5" class="filled-in chk-col-primary" id="sidebar_color_5">
                                        <label for="sidebar_color_5"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_6" class="filled-in chk-col-primary" id="sidebar_color_6">
                                        <label for="sidebar_color_6"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_7" class="filled-in chk-col-primary" id="sidebar_color_7">
                                        <label for="sidebar_color_7"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_8" class="filled-in chk-col-primary" id="sidebar_color_8">
                                        <label for="sidebar_color_8"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_9" class="filled-in chk-col-primary" id="sidebar_color_9">
                                        <label for="sidebar_color_9"></label>
                                    </span>
                                    <span>
                                        <input type="radio" name="sidebar_bg" value="color_10" class="filled-in chk-col-primary" id="sidebar_color_10">
                                        <label for="sidebar_color_10"></label>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Right sidebar end
        ***********************************-->
        <!--endRemoveIf(production)-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- Here is navigation script -->
    <script src="vendor/quixnav/quixnav.min.js"></script>
    <script src="js/quixnav-init.js"></script>
    <script src="js/custom.min.js"></script>
    <!--removeIf(production)-->
    <!-- Demo scripts -->
    <script src="js/styleSwitcher.js"></script>
    <!--endRemoveIf(production)-->
    <script src="vendor/highlightjs/highlight.pack.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>

</body>

<!-- Mirrored from demo.quixkit.com/corbin/email-read.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 19 Sep 2019 01:32:03 GMT -->
</html>