local action = argv.get_next_unused()
if action == "set_provider" then
    local provider = argv.get_next_unused()
    if not provider or (provider ~= "docker" and provider ~= "podman") then
        print("Usage: markitdown set_provider <docker | podman>")
        os.exit(1)
    end
    set_prop("markitdown.provider", provider)
    print("Provider set to: " .. provider)
    return 
end

-- Create a new container machine
local image = ship.create_machine("python:3.13-slim-bullseye")

-- Configure container runtime
image.provider = get_prop("markitdown.provider")
if not image.provider or image.provider == "" then
    print("Provider not set. use markitdown set_provider <docker | podman>")
end

-- Add build-time commands
image.add_comptime_command("apt-get update")
image.add_comptime_command("apt-get install -y git")
image.add_comptime_command("apt-get install -y python3")
image.add_comptime_command("apt-get install -y python3-pip")

image.add_comptime_command("git clone https://github.com/microsoft/markitdown.git")
image.add_comptime_command("cd markitdown && pip3 install -e 'packages/markitdown[all]' --break-system-packages")
-- Copy files

-- Start container with specific configuration
image.start({
    name="markitdown_container",
    flags = {
        "--workdir=/app",
        "-it"
    },
    volumes = {
        { ".", "/app" }
    },
    command = {"sh"}
})