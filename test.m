%邻接矩阵
Map=[0	19	0	0	0	0	29	0;
20	0	21	0	0	0	0	25;
0	22	0	23	0	0	0	0;
0	0	24	0	33	0	0	0;
0	0	0	34	0	35	0	28;
0	0	0	0	36	0	32	0;
30	0	0	0	0	31	0	0;
0	26	0	0	27	0	0	0];
%访问标识矩阵
Visited=[0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0;
0	0	0	0	0	0	0	0];


%区域节点映射关系
Relate=[1,2,0,3,8,4,7,6];
%节点数
Node=8;
Final_R=cell(9);

for startNode=1:8
    for destination=1:8
        if (startNode==destination)
            continue;
        end
        if (startNode==3||destination==3)
            continue;
        end
        %起点与终点
real_x=Relate(startNode);
real_y=Relate(destination);
%访问入栈标志
vflag=zeros(Node,1);
%临时结果矩阵
Tmp=zeros(8,8);
stack=[];

%起始遍历节点
stack=[stack,startNode];
p=1;
vflag(startNode)=1;
path=[];
while p>0
    begin=stack(p);
    flag=0;
    for j=1:Node
        if (Map(begin,j)>0&&Visited(begin,j)==0&&vflag(j)==0)
            if (j==destination)
                path=[path;stack]
               % Visited(begin,destination)=1;
                
              
                continue;
            else
                Visited(begin,j)=1;
                stack=[stack;j];
                p=p+1;
                vflag(j)=1;
            flag=1;
            break;
            end
        end
    end
    if (flag==0)
        vflag(stack(p))=0;
        for t=1:8
            Visited(stack(p),t)=0;
        end
        p=p-1;
       
        if(p==0)
           break;
        end
        stack=stack(1:p);
        
    end
end
%处理重复路径
% %消去多余路径保存在Tmp中
tmp_k=0;
len=1;
for t=1:size(path,1)
    if (path(t)==startNode)
        if(tmp_k~=0)
        Tmp(tmp_k,len)=destination;
        end
        tmp_k=tmp_k+1;    
        len=1;
    end
    Tmp(tmp_k,len)=path(t);
    len=len+1;
end
Tmp(tmp_k,len)=destination;
real_col=tmp_k;
for t=1:tmp_k
    for y=t+1:tmp_k
    if(Tmp(y,1:8)==Tmp(t,1:8))
       Tmp(y,(1:8))=0;
       real_col=real_col-1;
    end
    end  
end
Cell=zeros(real_col,36);
line=1;
begin=startNode;
for t=1:tmp_k
    begin=startNode;
   for j=2:8
     
     if (Tmp(t,j)==0)
         if(j~=2)
         line=line+1;
         end
         break;
     end
     beginsss=begin;
     k=int8(Map(begin,Tmp(t,j)));
     begin=Tmp(t,j);
     Cell(line,k)=1;
     Cell(line,real_x*2-1)=1;
     Cell(line,real_y*2)=1;
   end
end
    Final_R{real_x,real_y}=(Cell);
   
    if(real_y==4)
       
     Cell(1:line-1,real_y*2)=0;
      
     Cell(1:line-1,5*2)=1;
      Final_R{real_x,5}=(Cell);
      Cell(1:line-1,5*2)=0;
      Cell(1:line-1,9*2)=1;
      Final_R{real_x,9}=(Cell);
    end
    

    end
    
end
%重复节点信息添加

startNode=6;
for tt=1:2
te=[5,9];
     for destination=1:8
        if (startNode==destination)
            continue;
        end
        if (startNode==3||destination==3)
            continue;
        end
        %起点与终点
real_x=te(tt);
real_y=Relate(destination);
%访问入栈标志
vflag=zeros(Node,1);
%临时结果矩阵
Tmp=zeros(8,8);
stack=[];

%起始遍历节点
stack=[stack,startNode];
p=1;
vflag(startNode)=1;
path=[];
while p>0
    begin=stack(p);
    flag=0;
    for j=1:Node
        if (Map(begin,j)>0&&Visited(begin,j)==0&&vflag(j)==0)
            if (j==destination)
                path=[path;stack]
               % Visited(begin,destination)=1;
                
              
                continue;
            else
                Visited(begin,j)=1;
                stack=[stack;j];
                p=p+1;
                vflag(j)=1;
            flag=1;
            break;
            end
        end
    end
    if (flag==0)
        vflag(stack(p))=0;
        for t=1:8
            Visited(stack(p),t)=0;
        end
        p=p-1;
       
        if(p==0)
           break;
        end
        stack=stack(1:p);
        
    end
end
%处理重复路径
% %消去多余路径保存在Tmp中
tmp_k=0;
len=1;
for t=1:size(path,1)
    if (path(t)==startNode)
        if(tmp_k~=0)
        Tmp(tmp_k,len)=destination;
        end
        tmp_k=tmp_k+1;    
        len=1;
    end
    Tmp(tmp_k,len)=path(t);
    len=len+1;
end
Tmp(tmp_k,len)=destination;
real_col=tmp_k;
for t=1:tmp_k
    for y=t+1:tmp_k
    if(Tmp(y,1:8)==Tmp(t,1:8))
       Tmp(y,(1:8))=0;
       real_col=real_col-1;
    end
    end  
end
Cell=zeros(real_col,36);
line=1;
begin=startNode;
for t=1:tmp_k
    begin=startNode;
   for j=2:8
     
     if (Tmp(t,j)==0)
         if(j~=2)
         line=line+1;
         end
         break;
     end
     beginsss=begin;
     k=int8(Map(begin,Tmp(t,j)));
     begin=Tmp(t,j);
     Cell(line,k)=1;
     Cell(line,real_x*2-1)=1;
     Cell(line,real_y*2)=1;
   end
end
    Final_R{real_x,real_y}=(Cell);
   
    
    end
end
NewR=[4,5,9];
Cell=zeros(1,36);
for x=1:3
   for y=1:3
   if (x==y)
   continue;
   end
   Cell(1,NewR(x)*2-1)=1;
   Cell(1,NewR(y)*2)=1;
    Final_R{NewR(x),NewR(y)}=(Cell);
   end
end

