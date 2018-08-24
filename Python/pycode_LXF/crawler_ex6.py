# _*_ coding:utf-8 _*_
import urllib,urllib2

def loadPage(url,filename):
    #根据url发送请求，获取服务器响应文件
    print '正在下载' + filename
    headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36'}
    request = urllib2.Request(url,headers = headers)
    content = urllib2.urlopen(request).read()
    return content
def writePage(html,filename):
    #将html内容写入到本地
    print '正在保存' + filename
    with open(unicode(filename,'utf-8'),'w') as f:
        f.write(html)
    print '_' * 30

def tiebaSpider(url,beginPage,endPage):
    #贴吧爬虫调度器，负责组合处理每个页面的url
    for page in range(beginPage,endPage + 1):
        pn = (page - 1) * 50
        filename = '第' + str(page) + '页.html'
        fullurl = url + '&pn=' + str(pn)
        # print fullurl
        html = loadPage(fullurl,filename)
        writePage(html,filename)

if __name__ == '__main__':
    kw = raw_input('请输入贴吧名：')
    beginPage = int(raw_input('请输入起始页：'))
    endPage = int(raw_input('请输入结束页：'))

    url = 'https://tieba.baidu.com/f?'
    key = urllib.urlencode({'kw':kw})
    fullurl = url + key
    tiebaSpider(fullurl,beginPage,endPage)