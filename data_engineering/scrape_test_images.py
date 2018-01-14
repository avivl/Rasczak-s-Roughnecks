from selenium import webdriver
import os
import json
import urllib
import time

os.environ["PATH"] += os.pathsep + os.getcwd()
download_path = "test_data/"


def main():
    img_count = 0
    url = "https://www.insectimages.org/browse/taxthumb.cfm?order=369"
    driver = webdriver.Firefox()
    driver.get(url)
    downloaded_img_count = 0
    headers = {}
    headers[
        'User-Agent'] = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (" \
                        "KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
    for _ in range(12):
        driver.execute_script(
            "window.scrollTo(0, document.body.scrollHeight);")
        time.sleep(1)
    imges = driver.find_elements_by_xpath('//img[contains(@class,"img-responsive")]')
    print( "Total images:", len(imges), "\n")
    for img in imges:
        img_count += 1
        img_url = img.get_attribute('src')

        print("Downloading image", img_count, ": ", img_url)
        try:
            req = urllib.request.Request(img_url, headers=headers)
            raw_img = urllib.request.urlopen(req).read()
            f = open(download_path + str(
                downloaded_img_count) + "." + 'jpg', "wb")
            f.write(raw_img)
            f.close
            downloaded_img_count += 1
        except Exception as e:
            print("Download failed:", e)
        finally:
            print

    print("Total downloaded: ", downloaded_img_count, "/", img_count)
    driver.quit()


if __name__ == "__main__":
    main()