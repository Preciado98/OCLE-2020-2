extern int mcd(char x, char y);
char num1, num2;

void main (void){
printf("Ingresa un n%cmero: ",163);
scanf("%d", &num1);
printf("Ingresa otro n%cmero: ",163);
scanf("%d", &num2);

printf("El MCD es %d", mcd(num1, num2));
getchar();

}