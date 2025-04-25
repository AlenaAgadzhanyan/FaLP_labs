text_file(txt, 1).
text_file(jpeg, 2).
text_file(png, 2).
text_file(gif, 2).
text_file(bmp, 2).
text_file(svg, 1).
text_file(psd, 2).
text_file(mp3, 2).
text_file(wav, 2).
text_file(flac, 2).
text_file(mp4, 2).
text_file(avi, 2).
text_file(zip, 2).
text_file(tar, 2).
text_file(pdf, 2).
text_file(docx, 2).
text_file(xlsx, 2).
text_file(csv, 1).
text_file(exe, 2).
text_file(apk, 2).
text_file(html, 1).
text_file(mov, 2).

content(txt, 1).
content(jpeg, 2).
content(png, 2).
content(gif, 2).
content(bmp, 2).
content(svg, 2).
content(psd, 2).
content(mp3, 4).
content(wav, 4).
content(flac, 4).
content(mp4, 3).
content(avi, 3).
content(zip, 7).
content(tar, 7).
content(pdf, 1).
content(docx, 1).
content(xlsx, 5).
content(csv, 5).
content(exe, 6).
content(apk, 6).
content(html, 1).
content(mov, 3).

compression(txt, 1).
compression(jpeg, 3).
compression(png, 2).
compression(gif, 2).
compression(bmp, 1).
compression(svg, 1).
compression(psd, 1).
compression(mp3, 3).
compression(wav, 1).
compression(flac, 2).
compression(mp4, 3).
compression(avi, 3).
compression(zip, 2).
compression(tar, 1).
compression(pdf, 2).
compression(docx, 2).
compression(xlsx, 2).
compression(csv, 1).
compression(exe, 1).
compression(apk, 2).
compression(html, 1).
compression(mov, 3).

feature(txt, 6).
feature(jpeg, 6).
feature(png, 6).
feature(gif, 1).
feature(bmp, 6).
feature(svg, 4).
feature(psd, 3).
feature(mp3, 2).
feature(wav, 6).
feature(flac, 6).
feature(mp4, 2).
feature(avi, 6).
feature(zip, 6).
feature(tar, 6).
feature(pdf, 6).
feature(docx, 6).
feature(xlsx, 6).
feature(csv, 6).
feature(exe, 6).
feature(apk, 5).
feature(html, 6).
feature(mov, 6).

office(txt, 2).
office(jpeg, 2).
office(png, 2).
office(gif, 2).
office(bmp, 2).
office(svg, 2).
office(psd, 2).
office(mp3, 2).
office(wav, 2).
office(flac, 2).
office(mp4, 2).
office(avi, 2).
office(zip, 2).
office(tar, 2).
office(pdf, 2).
office(docx, 1).
office(xlsx, 1).
office(csv, 2).
office(exe, 2).
office(apk, 2).
office(html, 2).
office(mov, 2).

web_pages(txt, 2).
web_pages(html, 1).

made_by_apple(avi, 2).
made_by_apple(mov, 1).

question1(X1) :-
    write("Does this file format open correctly in a simple text editor like Notepad?"),nl,
    write("1. Yes"),nl,
    write("2. No"),nl,
    read(X1).

question2(X2) :-
    write("What data does this file format contain?"),nl,
    write("1. Text, documents"),nl,
    write("2. Images"),nl,
    write("3. Videos"),nl,
    write("4. Music"),nl,
    write("5. Spreadsheets"),nl,
    write("6. Compiled programs"),nl,
    write("7. It contains other files within itself"),nl,
    read(X2).

question3(X3) :-
    write("Does this format support compression?"),nl,
    write("1. No"),nl,
    write("2. Yes, lossless compression"),nl,
    write("3. Yes, lossy compression"),nl,
    read(X3).

question4(X4) :-
    write("What feature does this file format have?"),nl,
    write("1. It's used for short looping animations"),nl,
    write("2. The file extension contains a number"),nl,
    write("3. Files can store individual image layers"),nl,
    write("4. This is a vector graphics format"),nl,
    write("5. This format is intended for Android OS"),nl,
    write("6. None of the above"),nl,
    read(X4).

question5(X5) :-
    write("Is this format designed for Microsoft Office?"),nl,
    write("1. Yes"),nl,
    write("2. No"),nl,
    read(X5).

question6(X6) :-
    write("Is this format used for web pages?"),nl,
    write("1. Yes"),nl,
    write("2. No"),nl,
    read(X6).

question7(X7) :-
    write("Is this format developed by Apple?"),nl,
    write("1. Yes"),nl,
    write("2. No"),nl,
    read(X7).

start:-	question1(X1), question2(X2), question3(X3), question4(X4), question5(X5), question6(X6), question7(X7),
		text_file(X, X1), content(X, X2), compression(X, X3),
		feature(X, X4), office(X, X5),web_pages(X, X6),made_by_apple(X, X7),
		write("Format: "), write(X), nl.
