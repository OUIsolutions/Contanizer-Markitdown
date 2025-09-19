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
image.add_comptime_command("apt-get install -y ffmpeg")

image.add_comptime_command("git clone https://github.com/microsoft/markitdown.git")
image.add_comptime_command("cd markitdown && pip3 install -e 'packages/markitdown[all]' --break-system-packages")
-- Copy files
local all_args = {"markitdown"}
if action then 
    all_args[#all_args + 1] = action
end 
while true do 
    local arg = argv.get_next_unused()
    if not arg then break end 
    all_args[#all_args + 1] = arg
end 
local command = table.concat(all_args, " ")
-- Start container with specific configuration
image.start({
    name="markitdown_container",
    flags = {
        "--workdir=/app",
    },
    volumes = {
        { ".", "/app" }
    },
    command = {command}
})