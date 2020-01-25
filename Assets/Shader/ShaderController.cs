using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShaderController : MonoBehaviour
{
    // Start is called before the first frame update
    void Start() {
        Renderer renderer = GetComponent<Renderer>();
        renderer.material.SetColor("_BaseColor", Color.red);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
