#include <stdio.h>
#include <string.h>

/** char _flag[] = "lKKHqv2ehyqcqwrB7hmF1NHlzLMtIndc"; **/

char _k[] = "!Q@W#E$R%T^Y&U*I(O)P_{+}|";
char _d[] = { 0x4D, 0x1A, 0x0B, 0x1F, 0x52, 0x33, 0x16, 0x37,
	      0x4D, 0x2D, 0x2F, 0x3A, 0x57, 0x22, 0x58, 0x0B,
	      0x1F, 0x27, 0x44, 0x16, 0x6E, 0x35, 0x63, 0x11,
	      0x06, 0x6D, 0x1C, 0x34, 0x1E, 0x4D, 0x21, 0x47 };

void decrypt(char *data, char *key)
{
  int i; int keyLen = strlen(key);
  for(i = 0; i < strlen(data); i++)
    data[i] ^= key[i % keyLen];
}

int main()
{
  if(_d[0] > _d[1]) {
    printf("The right answer is often the simple answer.\n"
	   "The flag is encrypted but i will give you the encryption key\n"
	   "Encryption Key: %s\n", _k);
    return 1;
  }

  decrypt(_d, _k);
  printf("Flag: %s\n", _d);
  
  return 0;
}
