load("render.star", "render")
load("http.star", "http")

Weather_URL = "https://www.aviationweather.gov/cgi-bin/json/NavSiteJSON.php"

def main():
    rep = http.get(Weather_URL)
    if rep.status_code != 200:
        fail("Avaition request failed with status %d", rep.status_code)

    rate = rep.json()["1"]["wspd"]

    return render.Root(
        child = render.Text("BTC: %d USD" % rate)
    )