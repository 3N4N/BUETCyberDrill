# Terminator

Author: Enan Ajmain

## Description

Don't come with me if you want to live.

Please find the flag from the attached [file](../assets/ctf_files/TERMINATOR)

The format of this flag is UNICTF{flag}

## Walkthrough

The file is an ELF binary file, which is executable in Unix systems.

Open the binary in Ghidra and find the main function, which is named `main`.

```c
void main(undefined4 param_1,undefined8 param_2)
{
  cyber_drill2021_main(param_2,param_1);
  return;
}
```

As you can see, the main function just calls another function, named
`cyber_drill2021_main`. Open that function in Ghidra.

```c
undefined4 cyber_drill2021_main(long param_1,int param_2)
{
  FILE *__stream;
  char cVar1;
  undefined8 uVar2;
  char *__s;
  size_t sVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  char *__s_00;

  uVar2 = g_strdup("2be17443157bfc08b4c1f6231765e735");
  if (param_2 == 1) {
    fwrite("Almost there...\n",1,0x10,stdout);
    g_free(uVar2);
  }
  else {
    __s = (char *)g_strdup(*(undefined8 *)(param_1 + 8));
    sVar3 = strlen(__s);
    cVar1 = string_get(__s,(long)((int)sVar3 + -1));
    if (cVar1 == '\0') {
      uVar4 = cyber_drill2021_tintin(uVar2);
      __stream = stdout;
      uVar5 = g_utf8_strreverse(uVar4,0xffffffffffffffff);
      uVar6 = g_strconcat(&DAT_00102052,uVar5,0);
      __s_00 = (char *)g_strconcat(uVar6,&DAT_00102055,0);
      fputs(__s_00,__stream);
      g_free(__s_00);
      g_free(uVar6);
      g_free(uVar5);
      g_free(uVar4);
    }
    else {
      if (cVar1 == '\n') {
        fwrite("0a received",1,0xb,stdout);
      }
      else {
        fwrite("Only thing I want is complete silence...\n",1,0x29,stdout);
      }
    }
    g_free(__s);
    g_free(uVar2);
  }
  return 0;
}
```

This function has a variable `uVar2` which looks like a flag, or at least a some
permutation of the flag. If you go through the code, you'll see that it first
checks for an argument, that is, you need to run the binary with an argument.
Otherwise it just exits.

```c
uVar2 = g_strdup("2be17443157bfc08b4c1f6231765e735");
if (param_2 == 1) {
  fwrite("Almost there...\n",1,0x10,stdout);
  g_free(uVar2);
}
```

If you provide an argument, the function checks if the argument's last character
is a null character.
```c
__s = (char *)g_strdup(*(undefined8 *)(param_1 + 8));
sVar3 = strlen(__s);
cVar1 = string_get(__s,(long)((int)sVar3 + -1));
if (cVar1 == '\0') {
    // bla bla
}
```

Inside this if block, there is some string manipulation, which seems the only
part of the program that could be related to the flag. So, we need to get inside
this if block. But the way C programs works makes it impossible for a string to
have a null character as its last character, because null is used as a
string terminator. So we will have to get inside this if block using dynamic
reverse engineering. Time for some gdb action.

Run gdb with the TERMINATOR binary. Start the program (don't forget to provide
an argument) and get a breakpoint before the check for the if block happens. The
check is in `cyber_drill2021_main` function.

The compare instruction is as in the following.

```gdb
0x0000555555555550 <+363>:   cmp    DWORD PTR [rbp-0xb8],0x0
```

Now, set the memory at `$rbp-0xb8` to 0x0 and continue the program.

```gdb
gef➤ x/x $rbp-0xb8
0x7fffffffe388: 0x00000074
gef➤ set *0x7fffffffe388 = 0x0
gef➤ x/x $rbp-0xb8
0x7fffffffe388: 0x00000000
gef➤ continue
Continuing.
> 7e5671326f1c4b80cfb75134471eb2 <
[Inferior 1 (process 298) exited normally]
```

Voila! You got your flag. It's the number string in between the inverted angle
brackets: `7e5671326f1c4b80cfb75134471eb2`
