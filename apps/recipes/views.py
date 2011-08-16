import jingo


def homepage(request):
    # Return an http response that serves the index.html template
    return jingo.render(request, 'index.html')