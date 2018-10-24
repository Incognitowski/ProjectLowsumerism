<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style type="text/css">

        * {
            font-family: 'Nunito', sans-serif;
        }


            html::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
                background-color: #a0f0ed;
            }

            html::-webkit-scrollbar {
                width: 10px;
                background-color: #a0f0ed;
            }

            html::-webkit-scrollbar-thumb {
                background-color: #4dc0b5;
            }


        .material-icons.md-18 { font-size: 18px; }
        .material-icons.md-24 { font-size: 24px; }
        .material-icons.md-36 { font-size: 36px; }
        .material-icons.md-48 { font-size: 48px; }



    </style>
    <link rel="stylesheet" type="text/css" href="{{ asset('/css/app.css') }}">
    <script type="text/javascript" src="{{ asset('/js/app.js') }}"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            
            $('#menu-button').on('click',function(){
                $('#menu-button').fadeOut(300,function(){
                    $('#nav-menu').fadeIn(300);
                });
            });

            $('#close-menu-button').on('click',function(){
                $('#nav-menu').fadeOut(300,function(){
                    $('#menu-button').fadeIn(300);
                });
            });

            $('#mobile-menu-button').on('click',function(){
                $('#mobile-menu-button').fadeOut(300,function(){
                    $('#mobile-nav-menu').fadeIn(300);
                });
            });

            $('#mobile-close-menu-button').on('click',function(){
                $('#mobile-nav-menu').fadeOut(300,function(){
                    $('#mobile-menu-button').fadeIn(300);
                });
            });

        });
    </script>

    <title>Lowsumerism</title>

</head>
<body class='h-full w-full bg-teal-lighter'>

    <div class='h-px bg-teal'></div>

    <div class='w-screen lg:w-5/6 xl:w-3/5 max-w-xl lg:m-auto'>

        <div class='flex h-full flex-col w-full justify-between'>

            <div class='flex justify-between items-center'>

                <h1 class='text-shadow pt-10 mt-0 sm:mt-10 text-4xl md:text-5xl ml-4 lg:ml-0 text-semibold text-purple-dark tracking-wide'>Projeto <br> Lowsumerism</h1>
                    
                <div class='hidden sm:block'>

                    <button class='mt-10 focus:outline-none' id='menu-button'>
                        <i class="material-icons md-48 text-purple-dark hover:text-purple-light">menu</i>
                    </button>

                    <div id='nav-menu' class='rounded mt-10 p-4 flex border-2 border-purple-dark flex-col justify-around items-center' style='display: none'>
                        <button class='focus:outline-none' id='close-menu-button'>
                            <i class="material-icons md-18 text-purple-dark hover:text-purple-light">close</i>
                        </button>
                        <div class='mt-2 mb-2 h-px w-full bg-purple-dark'></div>
                        <a>Contato</a>
                        <div class='mt-2 mb-2 h-px w-full bg-purple-dark'></div>
                        <a>Uniuv</a>
                    </div>

                </div>

            </div>

            <div class='block sm:hidden my-5 mx-auto'>
                <button class='focus:outline-none' id='mobile-menu-button'>
                    <i class="material-icons md-24 text-purple-dark hover:text-purple-light">menu</i>
                </button>
                <div id='mobile-nav-menu' class='rounded p-4 flex border-2 border-purple-dark flex-col justify-around items-center' style='display: none'>
                    <button class='focus:outline-none' id='mobile-close-menu-button'>
                        <i class="material-icons md-18 text-purple-dark hover:text-purple-light">close</i>
                    </button>
                    <div class='mt-2 mb-2 h-px w-full bg-purple-dark'></div>
                    <a>Contato</a>
                    <div class='mt-2 mb-2 h-px w-full bg-purple-dark'></div>
                    <a>Uniuv</a>
                </div>
            </div>       

            <h3 class='m-auto text-shadow mt-0 sm:mt-10 text-2xl md:text-4xl ml-4 lg:ml-0 text-semibold text-teal-dark tracking-wide'>
                Uma investigação de consumo.
            </h3>

            <div class='mt-10 p-6 w-full md:w-5/6 m-auto bg-white shadow-lg border-t-2 border-teal-dark'>
                <p class='text-normal text-2xl leading-normal text-justify'>
                    &nbsp &nbsp &nbsp Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tempus ante id justo vulputate dignissim. Sed nec ex purus. Fusce sollicitudin nunc libero, non finibus mi bibendum et. Quisque pellentesque augue elit, sit amet molestie purus fermentum quis. Aenean blandit tellus lacus, nec hendrerit est blandit non.
                </p>
            </div>

            <div class="pt-10 md:mt-10 w-5/6 m-auto">
                <div class='flex flex-col md:flex-row justify-around items-center tracking-wide leading-normal'>
                    <p class='text-justify text-lg md:text-3xl ml-5 md:ml-0 w-full md:w-1/2 mb-5 md:mb-0 text-semibold text-teal-dark'>
                        Uma frase de impacto extremamente impactante falando sobre essa imagem da direita (ou abaixo).
                    </p>
                    <img src="{{ asset('svg/planet.svg') }}" class='w-1/3 h-auto'>
                </div>
            </div>

            <div class="pt-10 md:mt-10 w-5/6 m-auto">
                <div class='flex flex-col md:flex-row justify-around items-center tracking-wide leading-normal'>
                    <img src="{{ asset('svg/head.svg') }}" class='hidden md:block w-1/3 h-auto'>
                    <p class='text-justify text-lg md:text-3xl ml-5 md:ml-0 w-full md:w-1/2 mb-5 md:mb-0 text-normal text-teal-dark'>
                        Outra frase de impacto extremamente impactante, porém desta vez se trata da imagem da esquerda (ou abaixo neste caso também).
                    </p>
                    <img src="{{ asset('svg/head.svg') }}" class='block md:hidden w-1/3 h-auto'>
                </div>
            </div>
 

        </div>

    </div>

    <div class='pt-10 pb-10 flex flex-col md:flex-row justify-around items-center mt-10 background-topography w-full shadow-inner'>
        
        <h1 class='text-purple-dark md:mb-0 mb-5'>Lowsumerism</h1>
        <h2 class='text-purple-dark text-center'>A arte do consumo consciente.</h2>        

    </div>

    <div class='pt-10 pb-10 flex-col md:flex-row justify-around items-center bg-purple-dark w-full shadow-inner'>
        
        <div class='ml-10 md:ml-0 flex flex-col justify-around items-start md:flex-row'>
            <div>
                <h2 class='leading-normal tracking-wide text-white'>Alunos:</h2>
                <h4 class='leading-normal tracking-wide text-white'>Luiz Alcides Z. Junior</h4>
                <h4 class='leading-normal tracking-wide text-white'>Paula Beatriz Shreiner</h4>
                <h4 class='leading-normal tracking-wide text-white'>Paula Eliandra Partyka</h4>
                <h4 class='leading-normal tracking-wide text-white'>Valdinei Moura</h4>
            </div>
            <div class='md:ml-5 mt-5 md:mt-0'>
                <h2 class='leading-normal tracking-wide text-white'>Orientadores:</h2>
                <h4 class='leading-normal tracking-wide text-white'>Elio Ribeiro Faria Junior</h4>
                <h4 class='leading-normal tracking-wide text-white'>Tatiane Mary Baniski</h4>
            </div>
        </div>    


    </div>
    <div class='pt-5 pb-5 flex flex-col md:flex-row justify-around items-center background-topography w-full shadow-inner'>
        
        <h4 class='text-purple-dark md:mb-0 mb-5'>2018 @ UNIUV</h4>
        <h4 class='text-purple-dark text-center'>Programa de Incentivo à Pesquisa Acadêmica</h4>        

    </div>

</body>
</html>
