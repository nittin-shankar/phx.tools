defmodule PhxToolsWeb.InstructionComponents do
  @moduledoc """
  Shows the steps to execute different scripts depending on the operating system.
  """
  use PhxToolsWeb, :html

  @type assigns :: map()
  @type rendered :: Phoenix.LiveView.Rendered.t()

  slot :header, required: true
  slot :installation_command, required: true
  slot :instruction, required: true

  @spec os_instructions(assigns()) :: rendered()
  def os_instructions(assigns) do
    ~H"""
    <div class="solved-height font-normal">
      <div class="w-full h-full flex items-center justify-center">
        <div class="block lg:mt-3pct ">
          <h1 class="text-white text-center lg:text-2xl md:text-1xl sm:text-xl lg:mb-5pct md:mb-2pct sm:mb-2pct">
            <%= render_slot(@header) %>
          </h1>
          <div class="h-full w-full border-[4px] shadow-indigo-925 shadow-md border-indigo-935 rounded-md lg:mx-2pct pb-2">
            <div class="text-start px-[3%] lg:text-xl md:text-lg sm:text-1sm">
              <h1 class="text-white lg:mt-5 md:mt-5 sm:mt-4">
                1. Press the button to copy this command to your clipboard:
              </h1>
              <div class="flex items-center justify-evenly border-[1px] border-indigo-450 py-1 mx-4pct lg:mt-6 md:mt-5 sm:mt-4 rounded-lg">
                <h1 id="tool-installation" class="text-white  text-base font-thin">
                  <%= render_slot(@installation_command) %>
                </h1>
                <button
                  id="copy"
                  phx-hook="CopyHook"
                  class="text-white bg-indigo-450 py-1 px-2 rounded-lg text-base  lg:text-base md:text-1sm sm:text-sm"
                >
                  Copy
                </button>
              </div>

              <%= for item <- @instruction do %>
                <h1 class="text-white lg:mt-4 md:mt-5 sm:mt-4">
                  <%= render_slot(item) %>
                </h1>
              <% end %>
            </div>
          </div>
          <.link patch={~p"/"}>
            <button class="border-indigo-450 border-[1px] lg:mt-8 md:mt-5 sm:mt-5 p-1 text-indigo-450 text-base rounded-md lg:ml-3">
              Back
            </button>
          </.link>
        </div>
      </div>
    </div>
    """
  end
end
