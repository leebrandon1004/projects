#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <time.h>
#include <fcntl.h>
#include <netinet/tcp.h>
#include <netdb.h>

/* Set constant variables */
const char *weatherType[6] = {"Sunny","Thunder","Cloudy","Rain","Fog","Hail"};
#define MAXLINE 102400
#define MAXSUB 10240
#define MAXRESPONSE 10240

typedef struct City{
	char *name;
	char* localtime;
	int temperature;
	char* weather_descriptions;
	int wind_speed;
	int wind_degree;
	int pressure;
	int precip;
	int humidity;
	int cloudcover;
	int feelslike;
	int visibility;
}City;

/* Void commands */
void printCity(City* city){
	printf("In %s is currently %s and the weather is:\n",city->name,city->localtime);
	printf("Temperature: %d\n",city->temperature);
	printf("Weather description: %s\n",city->weather_descriptions);
	printf("wind speed: %d\n",city->wind_speed);
	printf("wind degree: %d\n",city->wind_degree);
	printf("pressure: %d\n",city->pressure);
	printf("precip: %d\n",city->precip);
	printf("humidity: %d\n",city->humidity);
	printf("cloudcover: %d\n",city->cloudcover);
	printf("feelslike: %d\n",city->feelslike);
	printf("visibility: %d\n\n\n",city->visibility);
}


typedef struct state{
	char name[30];
	int casesReported;
	struct state* next;
}State;

State* states;
State* lastState;

void addState(char* name,int cases){
	State *new = malloc(sizeof(State));
	strcpy(new->name,name);
	new->casesReported = cases;
	if(!states){
		states = new;
		lastState = new;
	}else{
		lastState->next = new;
		lastState = new;
	}
}
State* searchState(char* name){
	State* state = states;
	while(state){
		if(!strcmp(state->name,name)){
			return state;
		}
		state = state->next;
	} 
	return 0;
}

/* API usage COVD */
int getCovid(int sockfd){

	char sendline[MAXLINE + 1], recvline[MAXLINE + 1];
	char OutResponse[10240];
char* ptr;

int n;

snprintf(sendline, MAXSUB, 
     "GET /v2/key-value-stores/moxA3Q0aZh5LosewB/records/LATEST?disableRedirect=true HTTP/1.1\r\n"  
     "Host: api.apify.com\r\n"     
     "User-Agent: curl/7.65.3\r\n"
     "Accept: */*\r\n\r\n");
char* p;
int pos;
if (write(sockfd, sendline, strlen(sendline))>= 0) 
{
	read(sockfd, recvline, 1024);
	pos = 0;
    while ((n = read(sockfd, recvline+pos, MAXLINE)) > 0) 
    {
    	pos +=n;
        if(strstr(recvline,"casesByDays"))
        	break;
    }
    if(n <= 0){
    	printf("Error reading covid api\n");
    	return -1;
    }
    recvline[pos] = '\0';

    p = recvline;
    char* name;
    int cases;
    char *strcases;
    while(p = strstr(p,"\"name\":")){
    	p+=9;
    	name = p;
    	p = strchr(p,'"');

    	*p = 0;
    	p+=1;
    	p = strstr(p,"\"casesReported\": ");
    	p+= strlen("\"casesReported\": ");
    	strcases = p;
    	p = strchr(p,',');
    	*p = 0;
    	p+=1;
    	cases = atoi(strcases);
    	addState(name,cases);
    }
}          
	return 0;
}

/* API usage COVD Error*/
int apiCovid(){
	printf("loading covid info\n");
	struct sockaddr_in servaddr, cli; 
  
    int sockfd = socket(AF_INET, SOCK_STREAM, 0); 
    if (sockfd == -1) { 
        printf("socket creation failed...\n"); 
        exit(0); 
    } 
    bzero(&servaddr, sizeof(servaddr)); 
  
    servaddr.sin_family = AF_INET; 
    servaddr.sin_addr.s_addr = inet_addr("34.207.20.152"); 
    servaddr.sin_port = htons(80); 
  
    if (connect(sockfd, (const struct sockaddr *)&servaddr, sizeof(servaddr)) != 0) { 
        printf("connection with the server failed...\n"); 
        exit(0); 
    } 
    
    while(getCovid(sockfd) == -1){
    	printf("error geting covid information\n");
    	printf("trying again\n");
    }
  
    close(sockfd); 

	return 0;
}

/* API usage Weather */
int  cityWeather(int sockfd,char* name){
	char sendline[MAXLINE + 1], recvline[MAXLINE + 1];
	char OutResponse[1024];
City* city = malloc(sizeof(City));
char* p;
city->name = malloc(strlen(name));
strcpy(city->name,name);
char urlName[100];
urlName[0] = 0;
p = name;
char* pv = name;
while(1){
	p = strchr(p,' ');
	if(p)
		*p = 0;
	else{
		strcat(urlName,pv);
		break;
	}
	strcat(urlName,pv);
	strcat(urlName,"%20");
	p+=1;
	pv = p;
}
int n;

snprintf(sendline, MAXSUB, 
     "GET /current?access_key=a2b9bbe2c60fd77979c206a0805de693&query=%s HTTP/1.1\r\n" 
     "Host: api.weatherstack.com\r\n"    
     "User-Agent: curl/7.65.3\r\n"
     "Accept: */*\r\n\r\n",urlName);
if (write(sockfd, sendline, strlen(sendline))>= 0) 
{
    n = read(sockfd, recvline, 400); 
    
         recvline[n] = '\0';
    	if(!strstr(recvline,"HTTP/1.1 200 OK")){
    		return -1;
    	}
    n = read(sockfd, recvline, MAXLINE); 
    
         recvline[n] = '\0';

        p = recvline;
        char* name;
        int cases;
        char *strpointer;
        p = strstr(p,"\"localtime\":\"")+strlen("\"localtime\":\"");
        strpointer = p;
        p = strchr(p,'\"');
        *p = 0;
        p+=1;
        city->localtime = malloc(strlen(strpointer));
        strcpy(city->localtime,strpointer);
        p = strstr(p,"\"temperature\":") + strlen("\"temperature\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->temperature = atoi(strpointer);
        p = strstr(p,"\"weather_descriptions\":[\"") + strlen("\"weather_descriptions\":[\"");
        strpointer = p;
        p = strchr(p,'"');
        *p = 0;
        p+=1;
        city->weather_descriptions = malloc(strlen(strpointer));
        strcpy(city->weather_descriptions,strpointer);
        p = strstr(p,"\"wind_speed\":") + strlen("\"wind_speed\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->wind_speed = atoi(strpointer);
        p = strstr(p,"\"wind_degree\":") + strlen("\"wind_degree\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->wind_degree = atoi(strpointer);
        p = strstr(p,"\"pressure\":") + strlen("\"pressure\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->pressure = atoi(strpointer);
        p = strstr(p,"\"precip\":") + strlen("\"precip\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->precip = atoi(strpointer);
        p = strstr(p,"\"humidity\":") + strlen("\"humidity\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->humidity = atoi(strpointer);
        p = strstr(p,"\"cloudcover\":") + strlen("\"cloudcover\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->cloudcover = atoi(strpointer);
        p = strstr(p,"\"feelslike\":") + strlen("\"feelslike\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->feelslike = atoi(strpointer);
        p = strstr(p,"\"visibility\":") + strlen("\"visibility\":");
        strpointer = p;
        p = strchr(p,',');
        *p = 0;
        p+=1;
        city->visibility = atoi(strpointer);
        printCity(city);
    
}
	return 0;
}


/* API usage Weather Error */
int apiWeather(){
	struct sockaddr_in servaddr, cli; 
  
    int sockfd = socket(AF_INET, SOCK_STREAM, 0); 
    if (sockfd == -1) { 
        printf("socket creation failed...\n"); 
        exit(0); 
    } 
    bzero(&servaddr, sizeof(servaddr)); 
  
    servaddr.sin_family = AF_INET; 
    servaddr.sin_addr.s_addr = inet_addr("104.27.146.35"); 
    servaddr.sin_port = htons(80); 
  
    if (connect(sockfd, (const struct sockaddr *)&servaddr, sizeof(servaddr)) != 0) { 
        printf("connection with the server failed...\n"); 
        exit(0); 
    }
  
    char buffer[100];
    printf("Please enter a city name\n");
    scanf("\n");
    scanf("%[^\n]",buffer);
    if(cityWeather(sockfd,buffer) == -1){
    	printf("The city was not found in the api\n");
    } 
  
    close(sockfd); 

	return 0;
}


/* API usage COVD Error 2*/
void covidInfo(){
	char buffer[100];
	State* state;
	printf("please enter the State name\n");
	scanf("\n");
    scanf("%[^\n]",buffer);
    state = searchState(buffer);
	if(!state){
		printf("Error state not in the api database\n");
		return;
	}
	printf("The Covid information of %s is:\n",state->name);
	printf("%d total reported cases.\n\n",state->casesReported);
}
/* API usage ALL COVD States List*/
void allCovid(){
	State* state = states;
	while(state){
		printf("State %s\n",state->name);
		printf("%d cases reported\n",state->casesReported);
		state = state->next;
	}
}
/* Int main command*/
int main(){
	srand(time(0));
	int opt;
	int end = 0;
	apiCovid();
	while(!end){
		printf("choose an option\n");
		printf("1. Look up weather information by City name.\n");
		printf("2. Loop up COVID-19 information by State name.\n");
		printf("3. Show all covid information.\n");
		printf("4. Exit the program.\n");
		scanf("%d",&opt);
		switch(opt){
			case 1:
				apiWeather();
				break;
			case 2:
				covidInfo();
				break;
			case 3:
				allCovid();
				break;
			case 4:
				end = 1;
				break;

		}		

	}
	printf("bye\n");
	return 0;
}
