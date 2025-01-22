

This script allows users to input a list of IP addresses (space-separated) and generates configuration commands for a firewall. The script processes each IP address, determines if it has a subnet mask, and formats the output accordingly. It also creates a firewall address group with the provided IP addresses.

## Usage

1. **Run the Script:**
   ```bash
   ./forti.sh
   ```

2. **Enter IP Addresses:**
   - When prompted, enter the IP addresses separated by spaces.
   - Example: `192.168.1.1 192.168.2.0/24 10.0.0.1/32`

3. **Enter Group Name:**
   - After processing the IP addresses, you will be prompted to enter a group name for the firewall address group.

## Script Details

- **Input:**
  - The script reads a list of IP addresses from the user.
  - Each IP address can optionally include a subnet mask.

- **Processing:**
  - The script splits each IP address into its base address and subnet mask.
  - If no subnet mask is provided or if it is `32`, the script assumes a `/32` subnet mask.

- **Output:**
  - The script generates configuration commands for each IP address.
  - It creates a firewall address group with the provided IP addresses.

## Example

```bash
Enter IP address list (Space separated).  or Press ctrl+c to exit the script
192.168.1.1 192.168.2.0/24 10.0.0.1/32

Output:

edit 192.168.1.1
set subnet 192.168.1.1/32
next
edit 192.168.2.0/24
set subnet 192.168.2.0/24
next
edit 10.0.0.1
set subnet 10.0.0.1/32
next
end
Enter group name: my_group
config firewall addrgrp
edit my_group
set member 192.168.1.1 192.168.2.0/24 10.0.0.1
next
end
```

## Notes

- Ensure the script has executable permissions:
  ```bash
  chmod +x forti.sh
  ```

- This script is designed for educational purposes and may need adjustments for production use.

## License

This project is licensed under the MIT License.
```
