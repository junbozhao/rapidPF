# Overview 

The code consists of three main blocks, listed in the following table.

Name | Function
:--- | :---
Case file generator | Merge several case files & connection information |
Case file splitter | Adjust case files to account for core and copy nodes |
Case file parser | Generate mathematical problem formulation |

Their relationship is shown in the following:

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICAgY29ubihDb25uZWN0aW9uIGluZm9ybWF0aW9uKSAtLT4gZ2VuZXJhdG9yOjo6Y2FzZS1maWxlLXg7XG4gICAgbXBjMShDYXNlIGZpbGUgMSkgLS0-IGdlbmVyYXRvcihDYXNlIGZpbGUgZ2VuZXJhdG9yKTtcbiAgICBtcGMyKENhc2UgZmlsZSAyKSAtLT4gZ2VuZXJhdG9yO1xuICAgIG1wY2RvdCguLi4pIC0tPiBnZW5lcmF0b3IoQ2FzZSBmaWxlIGdlbmVyYXRvcik7XG4gICAgbXBjbihDYXNlIGZpbGUgbikgLS0-IGdlbmVyYXRvcihDYXNlIGZpbGUgZ2VuZXJhdG9yKTtcbiAgICBnZW5lcmF0b3ItLT5zcGxpdHRlcihDYXNlIGZpbGUgc3BsaXR0ZXIpOjo6Y2FzZS1maWxlLXg7XG4gICAgc3BsaXR0ZXItLT5wYXJzZXIoQ2FzZSBmaWxlIHBhcnNlcik6OjpjYXNlLWZpbGUteDtcbiAgICBwYXJzZXIgLS0-IHNvbHZlcjEoQURNTSk6Ojpzb2x2ZXI7XG4gICAgcGFyc2VyIC0tPiBzb2x2ZXIyKEFsYWRpbik6Ojpzb2x2ZXI7XG4gICAgcGFyc2VyIC0tPiBzb2x2ZXJEb3QoLi4uKTo6OnNvbHZlcjtcblxuICAgIHN0eWxlIGNvbm4gZmlsbDojZGRmZmRkO1xuICAgIGNsYXNzRGVmIGNhc2UtZmlsZS14IGZpbGw6I2JiYmJiYjtcbiAgICBjbGFzc0RlZiBzb2x2ZXIgZmlsbDojRkZBQTMzOyIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In19)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICAgY29ubihDb25uZWN0aW9uIGluZm9ybWF0aW9uKSAtLT4gZ2VuZXJhdG9yOjo6Y2FzZS1maWxlLXg7XG4gICAgbXBjMShDYXNlIGZpbGUgMSkgLS0-IGdlbmVyYXRvcihDYXNlIGZpbGUgZ2VuZXJhdG9yKTtcbiAgICBtcGMyKENhc2UgZmlsZSAyKSAtLT4gZ2VuZXJhdG9yO1xuICAgIG1wY2RvdCguLi4pIC0tPiBnZW5lcmF0b3IoQ2FzZSBmaWxlIGdlbmVyYXRvcik7XG4gICAgbXBjbihDYXNlIGZpbGUgbikgLS0-IGdlbmVyYXRvcihDYXNlIGZpbGUgZ2VuZXJhdG9yKTtcbiAgICBnZW5lcmF0b3ItLT5zcGxpdHRlcihDYXNlIGZpbGUgc3BsaXR0ZXIpOjo6Y2FzZS1maWxlLXg7XG4gICAgc3BsaXR0ZXItLT5wYXJzZXIoQ2FzZSBmaWxlIHBhcnNlcik6OjpjYXNlLWZpbGUteDtcbiAgICBwYXJzZXIgLS0-IHNvbHZlcjEoQURNTSk6Ojpzb2x2ZXI7XG4gICAgcGFyc2VyIC0tPiBzb2x2ZXIyKEFsYWRpbik6Ojpzb2x2ZXI7XG4gICAgcGFyc2VyIC0tPiBzb2x2ZXJEb3QoLi4uKTo6OnNvbHZlcjtcblxuICAgIHN0eWxlIGNvbm4gZmlsbDojZGRmZmRkO1xuICAgIGNsYXNzRGVmIGNhc2UtZmlsZS14IGZpbGw6I2JiYmJiYjtcbiAgICBjbGFzc0RlZiBzb2x2ZXIgZmlsbDojRkZBQTMzOyIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In19)

The interface of the blocks is made up of matpower case files.
This allows to leverage all of the built-in functionality that comes with `matpower`.

!!! note "Visualizing case files"
    There is an exquisite [open source tool](https://immersive.erc.monash.edu/STAC/) for visualizing case files: simply drag and drop a valid case file and be merry.

Specifically the input to the case file generator consists of several case files and their connection information; the connection information encodes *who* is connected to *whom* and *by what* kind of transformer.
The output of the case file generator is, again, a case file, which is then fed to the case file splitter.
The splitter adds information to each individual case file about neighboring buses.
This is then fed to the caes file parser (in the form of a case file) whose output is a mathematial problem formulation in terms of function handles.

## Allowed connections
Systems can be connected in arbitrary ways at generation buses, for instance:

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpO1xuICAgbWFzdGVyIC0tPiBzbGF2ZTIoU2xhdmUgMik7IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpO1xuICAgbWFzdGVyIC0tPiBzbGF2ZTIoU2xhdmUgMik7IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpIC0tPiBzbGF2ZTIoU2xhdmUgMikgLS0-IG1hc3RlcjsiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpIC0tPiBzbGF2ZTIoU2xhdmUgMikgLS0-IG1hc3RlcjsiLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFI7XG5tYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpIC0tPiBzbGF2ZTIoU2xhdmUgMik7IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFI7XG5tYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpIC0tPiBzbGF2ZTIoU2xhdmUgMik7IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0)

There may be several connections between two systems too.

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpIC0tPiBzbGF2ZTIoU2xhdmUgMik7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpOyIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFI7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpIC0tPiBzbGF2ZTIoU2xhdmUgMik7XG4gICBtYXN0ZXIoTWFzdGVyKSAtLT4gc2xhdmUxKFNsYXZlIDEpOyIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)

!!! warning Multiple lines between same buses
    It is currently not supported to connect several lines between the *same* buses.