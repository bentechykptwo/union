<script lang="ts">
import { cn } from "$/lib/utilities/shadcn.ts"
import { Badge } from "$lib/components/ui/badge"

export let className = ""
</script>

<Badge
  variant="outline"
  class={cn(
    'text-sm text-left left-2 top-18 absolute border-solid border-amber-400/40 bg-amber-200 dark:bg-card rounded-md',
    className,
  )}
>
  page under construction 👷‍♂️
</Badge>
