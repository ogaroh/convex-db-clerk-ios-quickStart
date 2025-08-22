import { query, mutation } from "./_generated/server";
import { v } from "convex/values";

// get all tasks
export const get = query({
  args: {},
  handler: async (ctx) => {
    return await ctx.db.query("tasks").collect();
  },
});

// Add a new task
export const add = mutation({
  args: { text: v.string() },
  handler: async (ctx, { text }) => {
    await ctx.db.insert("tasks", {
      text,
      isCompleted: false,
    });
  },
});

// Edit an existing task (update text)
export const edit = mutation({
  args: { id: v.id("tasks"), text: v.string() },
  handler: async (ctx, { id, text }) => {
    await ctx.db.patch(id, { text });
  },
});

// Mark a single task complete/incomplete
export const complete = mutation({
  args: { id: v.id("tasks"), isCompleted: v.boolean() },
  handler: async (ctx, { id, isCompleted }) => {
    await ctx.db.patch(id, { isCompleted });
  },
});

// Delete a single task
export const remove = mutation({
  args: { id: v.id("tasks") },
  handler: async (ctx, { id }) => {
    await ctx.db.delete(id);
  },
});

// Delete ALL tasks
export const removeAll = mutation({
  args: {},
  handler: async (ctx) => {
    const allTasks = await ctx.db.query("tasks").collect();
    for (const task of allTasks) {
      await ctx.db.delete(task._id);
    }
  },
});

// Toggle all tasks at once
export const toggleAll = mutation({
  args: { isCompleted: v.boolean() },
  handler: async (ctx, { isCompleted }) => {
    const allTasks = await ctx.db.query("tasks").collect();
    for (const task of allTasks) {
      await ctx.db.patch(task._id, { isCompleted });
    }
  },
});
