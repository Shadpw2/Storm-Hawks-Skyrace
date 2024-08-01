import os

class stream:
    def __init__(self, name):
        self.f = file(name)
        self.count = 0

    def __call__(self):
        assert self.f, 'already closed stream'
        self.count += 1
        result = self.f.readline()
        if result == '':
            self.f.close()
            self.f = None
        return result

def classcontents(input, name):
    line = ''
    result = []
    while not line.startswith('class ' + name):
        line = input()
        assert line != ''

    exposed_args = False
    while True:
        tmp = input()
        if tmp == '':
            break
        tmp = tmp.rstrip()
        level = 0
        while tmp.startswith('\t'):
            level += 1
            tmp = tmp[1:]

        if level == 0 and tmp.startswith('class'):
            break
        tmp = tmp.lstrip()
        if exposed_args:
            if level == 1 and tmp.startswith('):'):
                exposed_args = False
                result.append(tmp)
            else:
                assert level == 2, 'badly formatted function-def'
                result.append(tmp)
        elif level == 1:
            if tmp.startswith('def'):
                if tmp.endswith('('):
                    exposed_args = True
                    result.append(tmp)
            elif tmp.startswith('##'):
                result.append(tmp)

    return result

def grabstuff(folder, name):
    try:
        s = stream(os.path.join(folder, name + '.py'))
    except:
        return []

    try:
        return classcontents(s, name)
    except Exception, why:
        raise why.__class__, str(why) + ' line number: ' + str(s.count)

# ... [Include other classes and methods like XML, info, addmethods, parse here] ...

def generate_commented_xml(file_path):
    """
    Generate commented XML from a Python file.
    This function uses the custom XML generation logic.
    """
    fname = os.path.basename(file_path).split('.')[0]
    return str(info(fname))

def process_file(file_path):
    """
    Process a single Python file to generate an XML file.
    """
    xml_content = generate_commented_xml(file_path)
    xml_file_path = os.path.splitext(file_path)[0] + '.xml'

    with open(xml_file_path, 'w') as xml_file:
        xml_file.write(xml_content)
    print("Generated XML for {} in {}".format(file_path, xml_file_path))

def process_directory(directory):
    """
    Process all Python files in a directory and its subdirectories.
    """
    for root, dirs, files in os.walk(directory):
        for file_name in files:
            if file_name.endswith('.py'):
                file_path = os.path.join(root, file_name)
                process_file(file_path)

def main():
    # Base directories to start scanning from
    base_directories = ['base', 'cell', 'client']

    for dir_name in base_directories:
        full_dir_path = os.path.join('C:\\Users\\Shadp\\OneDrive\\Desktop\\StormHawks-SkyRace\\dev\\res\\entities', dir_name)
        if os.path.exists(full_dir_path):
            process_directory(full_dir_path)
        else:
            print("Directory {} does not exist.".format(full_dir_path))

if __name__ == '__main__':
    main()
