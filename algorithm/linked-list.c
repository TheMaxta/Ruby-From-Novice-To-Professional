// This Program should Implement my first linked list.
// Will use this, when an array just doesn't suffice.
// Linked Lists contain variables with two features,
// first). the variable-data. (string, int, bool, etc..)
// second). the pointer* to the next variable in order.
// A linked list is one contituous string of data that is easy to manip#include <stdio.h>



// Struct is father structure of our node's in our list..
// This contains our pointers to next mem adress, and our variables..
struct node
{
	int data;
	int key;
	struct node *next;
};

struct node *head = NULL;		// First node
struct node *current = NULL;	// Most Recent node

// display the whole list
void printList()
{
	struct node *ptr = head ; // Start with head node / first node
	printf("\n[ ");

	while(ptr != NULL)	// until we reach current node/end
	{
		printf("(%d,%d) ",ptr->key,ptr->data); // print current node key, and its data..
		ptr = ptr->next // transition to next node, by using next in pointer
	}
	printf(" ]");
}

//insert link at the first location / Replace head node
void insertFirst(int key, int data)
{
	//create link
	struct node *link = (struct node*) malloc(sizeof(struct node));

	link -> key = key;
	link -> data = data;

	// point it to old first node
	link -> head;

	// point first to new node
	head = link;

}

//delete first item
struct node* deleteFirst()
{
	//save reference to first link
	struct node *tempLink = head;

	//mark next to first link as first
	head = head -> next;

	//return the deleted link
	return tempLink;
}

// is list empty?
bool isEmpty(){
	return head == NULL;
}


//find length of linked list.. count all available nodes...
int length()
{
	int length = 0;
	struct node *current;

	for(current = head; current != NULL; current -> next)
	{
		length += 1;
	}
	return length;
}

// Find a link, with a given key
struct node* find(int key){
	//start from the first link
	struct node* current = head;

	//if list is empty?
	if(head == NULL)
		return NULL;

	//navigate through the list, if current_key == key loop breaks, and functon returns key
	while(current -> key != key){

		if (current -> next == NULL)
		{
			return NULL;
		} else {
			//go to next link
			current = current -> next;
		}
	}
	return current;
}


// Delete a link, with a passed key
struct node* delete(int key){

	// Start at our first link
	struct node* current = head;
	struct node* previous = NULL;

	// if list is empty,
	if(head == NULL){
		return NULL;
	}

	//navigate through list
	while(current -> key != key){

		//if it is last node, return null
		if(current->next == NULL){
			return NULL;
		} else {
			//store reference to current link
			previous = current;
			//move to next link
			current = current-next
		}
	}

	//found a match, update the link
	if(current == head) {
		//change first point to next link
		head = head->next;
	} else {
		//bypass current link
		previous -> next = current -> next;
	}
	return current;
}

void sort(){
	int i, j, k, tempKey, tempData ;
	struct node *current;
	struct node *next;

	int size = length(); // get size of list
	k = size ;

	for ( i = 0 ; i < size - 1 ; i++, k-- ) {
		current = head;
		next = head -> next ;

		for ( j = 1 ; j < k; j++ ) {

			if ( current -> data > next -> data ) {
				tempData = current -> data ;
				current -> data = next -> data ;
				next -> data = tempData ;

				tempKey = current -> key;
				current -> key = next -> key;
				next -> key = tempKey;
			}

			current = current -> next;
			next = next -> next;
		}
	}
}

void reverse(struct node** head_ref){
	struct node* prev = NULL;
	//ekahfsdnjlfkj
}