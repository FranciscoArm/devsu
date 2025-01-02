from django.http import HttpResponse


def index(request):
    return HttpResponse("<h1>ESTE ES UN PROYECTO PARA DEVSU</h1> <h4>Autor: FRANCISCO ARMIJOS. </h4> <br>Menu <br><h4> Admin </h4><h4> Api</h4>")

