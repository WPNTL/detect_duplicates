# Duplicate File Detection

This is a Shell Script program that detects duplicate files in a directory based on both sizes and content using MD5 hashes.

## How It Works

1. The program iterates through all files in the specified directory.
2. For each file, it calculates the size and the MD5 hash of the content.
3. It stores size and hash information in associative arrays.
4. It then displays duplicate files based on size and content (MD5 hash).

## Requirements

- Unix-like OS (Linux, macOS)
- Bash (Bourne Again Shell)

## How to Use

1. Clone or download this repository.
2. Open a terminal and navigate to the project directory.
3. Give execute permission to the `detect_duplicates.sh` file: `chmod +x detect_duplicates.sh`
4. Run the script: `./detect_duplicates.sh`

## Customization

- Replace `"/path/to/your/directory"` with the absolute path of the directory you want to check.

## Disclaimer

This is an educational example and can be adjusted as needed. Always test in a safe environment before using in a production context.

## Contributions

Contributions are welcome! Feel free to fork this repository, make modifications, and send a pull request.

## License

This project is licensed under the [GNU General Public License (GPL-3.0)](https://www.gnu.org/licenses/gpl-3.0.en.html).
