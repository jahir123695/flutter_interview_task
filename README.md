#  Flutter Collections Accordion UI

This project is a Flutter assignment demonstrating an **accordion-style product collections screen**.

Users can expand a collection to view product images horizontally, similar to modern e-commerce apps.

---

##  Features

- Scrollable list of collections
- Accordion expand & collapse animation
- Only **one collection open at a time**
- Smooth UI animations
- Horizontal product image preview
- “+N” overlay when extra images exist
- Rounded cards with elevation
- Clean and modular Flutter code structure

---

##  Implementation Approach

### State Management
A `StatefulWidget` is used on the home screen with an `expandedIndex` variable to control which collection is open. This ensures only one accordion is expanded at a time.

### Animations Used
- `AnimatedSize` for smooth expansion and collapse  
- `AnimatedRotation` for rotating the dropdown arrow icon  

### UI Structure
The app is broken into reusable components:
- **Model** → Defines collection data  
- **Card Widget** → Reusable accordion UI  
- **Screen** → Controls list and state  


