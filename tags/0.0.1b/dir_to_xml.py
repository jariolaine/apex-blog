#!/usr/bin/env python
import os.path
from xml.dom.minidom import Document
from optparse import OptionParser

doc      = Document()
folders  = doc.createElement("directories")
files    = doc.createElement("files")
startdir = ""

def makenode(name,txt,attr=[],val=[]):
    elem = doc.createElement(name)
    for i in range(0,len(attr)):
        elem.setAttribute(attr[i], val[i])

    elem.appendChild(doc.createTextNode(txt))
    return elem

def loopdir(path):

    # Loop directory
    for cur in os.listdir(path):

        filename = os.path.join(path, cur)

        resource = filename.replace(startdir, "")
        resource = resource.replace(os.sep, "/")

        if os.path.isdir(filename):
            folders.appendChild(makenode("directory", resource))
            #Loop sub directory
            loopdir(filename)

        if os.path.isfile(filename):
            files.appendChild(makenode("file", resource))

def main():

    global startdir

    parser = OptionParser(
		usage="usage: %prog [options] directory",
		version="%prog 1.0"
	)
    parser.add_option(
		"-o",
		"--output",
		type="string",
		action="store",
		dest="output",
		default="file_list.xml",
		help="Output file path and name."
	)
    (options, args) = parser.parse_args()

    if len(args) != 1:
        parser.error("Wrong number of arguments.")
    if not os.path.isdir(args[0]):
        parser.error("Directory not exists.")

    startdir = os.path.normpath(args[0])
    loopdir(startdir)

    upload = doc.createElement("upload")
    upload.appendChild(folders)
    upload.appendChild(files)
    doc.appendChild(upload)

    destfile = open(options.output, "w")

    try:
        destfile.write(doc.toxml(encoding="utf-8"))
    finally:
        destfile.close()
        print ""
        print "File list exported to: " + options.output
        print ""

if __name__ == '__main__':
    main()
