<script lang="ts">
import { Command as CommandPrimitive } from "cmdk-sv"
import Search from "virtual:icons/lucide/search"
import { cn } from "$lib/utilities/shadcn.js"

type $$Props = CommandPrimitive.InputProps

let className: string | undefined | null = undefined
export { className as class }
export let value = ""
</script>

<div class="bg-muted text-foreground flex items-center border-b px-2" data-cmdk-input-wrapper="">
	<Search class="mr-2 size-4 shrink-0 opacity-80 text-foreground" />
	<CommandPrimitive.Input
		class={cn(
			'dark:placeholder:text-primary/60 placeholder:text-muted-foreground/85',
			"flex h-11 w-full bg-transparent py-3 text-sm outline-none disabled:cursor-not-allowed disabled:opacity-50",
			className
		)}
		{...$$restProps}
		bind:value
	/>
</div>
