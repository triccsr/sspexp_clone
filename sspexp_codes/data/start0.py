def start_from_0(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    modified_lines = []
    for line in lines:
        parts = line.split()
        if parts and parts[0].isdigit():
            number = int(parts[0])
            if number > 0:
                parts[0] = str(number - 1)
        if parts and parts[1].isdigit():
            number = int(parts[1])
            if number > 0:
                parts[1] = str(number - 1)
        modified_lines.append(' '.join(parts) + '\n')
    
    with open(file_path, 'w') as file:
        file.writelines(modified_lines)

start_from_0('YAGO_IW.txt')