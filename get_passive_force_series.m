   f   u   n   c   t   i   o   n       [   f   _   s   e   e   ]       =       g   e   t   _   p   a   s   s   i   v   e   _   f   o   r   c   e   _   s   e   r   i   e   s   (   l   t   )      
      
   %       I   n   p   u   t   s      
   %       l   t   :       n   o   r   m   a   l   i   z   e   d       l   e   n   g   t   h       o   f       t   e   n   d   o   n       (   s   e   r   i   e   s       e   l   a   s   t   i   c       e   l   e   m   e   n   t   )      
      
   %       O   u   t   p   u   t      
   %       f   _   s   e   e   :       p   a   s   s   i   v   e       f   o   r   c   e       w   h   e   n       m   u   s   c   l   e       f   i   b   r   e       l   o   n   g   e   r       t   h   a   n       r   e   s   t   i   n   g       l   e   n   g   t   h       (   d   u   e       t   o      
   %       s   e   r   i   e   s       e   l   e   m   e   n   t   )      
      
      
   f   _   s   e   e       =       z   e   r   o   s   (   s   i   z   e   (   l   t   )   )   ;      
   s   l   a   c   k   _   l   e   n   g   t   h       =       1   ;           %       r   e   s   t   i   n   g       l   e   n   g   t   h       o   f       t   e   n   d   o   n      
      
   %       f   o   r       n       =       1   :   1   :   l   e   n   g   t   h   (   l   t   )      
   %                       i   f       l   t   (   n   )       <       s   l   a   c   k   _   l   e   n   g   t   h      
   %                                       f   _   s   e   e   (   n   )       =       0   ;      
   %                       e   l   s   e      
   %                                       f   _   s   e   e   (   n   )       =       1   0   *   (   l   t   (   n   )       -       s   l   a   c   k   _   l   e   n   g   t   h   )       +       2   4   0   *   (   l   t   (   n   )       -       s   l   a   c   k   _   l   e   n   g   t   h   )   ^   2   ;      
   %                       e   n   d      
   %       e   n   d      
      
   e   n   d