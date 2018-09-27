

try:
    print 'try...'
    r = 10 / int('a')
    print 'result:', r
except ZeroDivisionError, e:
    print 'except:', e
except ValueError, e:
    print 'except:', e
else:
    print 'no error!'
finally:
    print 'finally...'
print 'END'